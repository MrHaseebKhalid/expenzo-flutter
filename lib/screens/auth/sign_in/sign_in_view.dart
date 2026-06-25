import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/provider/auth_provider.dart";
import "package:expenzo/screens/auth/email_verification/email_verification_sent_view.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:expenzo/widgets/my_text_field.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../resources/resources.dart";

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignIn() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authProvider = context.read<AuthProvider>();

    try {
      await authProvider.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (mounted) {
        if (authProvider.isEmailVerified) {
          Constant.navigateToRoute(context, Routes.initialDetails);
        } else {
          // Navigate to email verification screen
          Constant.moveToNext(
            context,
            EmailVerificationSentView(email: _emailController.text.trim()),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? 'Sign in failed'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var authProvider = context.watch<AuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: FetchPixels.getPixelHeight(20),
                horizontal: FetchPixels.getPixelWidth(25),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  getVerSpace(80),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: simpleText(
                      R.strings.welcomeText,
                      style: R.textStyle.semiBoldInter().copyWith(fontSize: 21),
                    ),
                  ),
                  getVerSpace(5),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: simpleText(
                      R.strings.signInText,
                      style: R.textStyle.mediumInter().copyWith(fontSize: 19),
                    ),
                  ),

                  getVerSpace(50),
                  getTextFieldText("Email Address"),
                  getVerSpace(10),
                  MyTextField(
                    controller: _emailController,
                    showText: "example@gmail.com",
                    prefixSvgIconPath: R.icons.mailIcon,
                    autofillHints: const [AutofillHints.email],
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(30),
                  getTextFieldText("Password"),
                  getVerSpace(10),
                  MyTextField(
                    controller: _passwordController,
                    prefixSvgIconPath: R.icons.passwordIcon,
                    moveNext: false,
                    showButton: true,
                    eyeIconNumber: 1,
                    eyeIconAllowNumber: 1,
                    autofillHints: const [AutofillHints.password],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        authProvider.changeEyeIconAllow(number: 1, value: true);
                      } else {
                        authProvider.changeEyeIconAllow(
                          number: 1,
                          value: false,
                        );
                      }
                    },
                    onTapEyeButton: () {
                      authProvider.changeEyeIcon(number: 1);
                    },
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(5),

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Constant.navigateToRoute(
                          context,
                          Routes.forgetPasswordEmail,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: FetchPixels.getPixelHeight(8),
                          horizontal: FetchPixels.getPixelWidth(3),
                        ),
                        child: simpleText(
                          "forget password?",
                          style: R.textStyle.semiBoldInter().copyWith(
                            fontSize: 13,
                            color: R.colors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),

                  getVerSpace(40),
                  MyButton(
                    buttonText: authProvider.isLoading
                        ? "Signing in..."
                        : "Sign in",
                    onTap: () {
                      if (!authProvider.isLoading) {
                        _handleSignIn();
                      }
                    },
                  ),

                  getVerSpace(50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Divider(color: R.colors.iconColor)),
                      getHorSpace(10),
                      simpleText(
                        "Or With",
                        style: R.textStyle.mediumInter().copyWith(fontSize: 12),
                      ),
                      getHorSpace(10),
                      Expanded(child: Divider(color: R.colors.iconColor)),
                    ],
                  ),

                  getVerSpace(30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 30,
                    children: [
                      getSignOptions(R.icons.googleIcon),
                      getSignOptions(R.icons.facebookIcon),
                      getSignOptions(R.icons.twitterIcon),
                    ],
                  ),
                  getVerSpace(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      simpleText(
                        "Don’t have an account?",
                        style: R.textStyle.regularInter().copyWith(
                          fontSize: 14.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Constant.navigateToRoute(context, Routes.signUp);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: FetchPixels.getPixelHeight(15),
                            horizontal: FetchPixels.getPixelWidth(5),
                          ),

                          child: simpleText(
                            "Sign up",
                            style: R.textStyle.semiBoldInter().copyWith(
                              color: R.colors.primaryColor,
                              decoration: TextDecoration.underline,
                              decorationColor: R.colors.primaryColor,
                              fontSize: 14.5,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
