import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/provider/auth_provider.dart";
import "package:expenzo/screens/auth/email_verification/email_verification_sent_view.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:provider/provider.dart";

import "../../../base/constant.dart";
import "../../../resources/resources.dart";
import "../../../widgets/my_text_field.dart";

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Sync password fields when autofill fills password
    _passwordController.addListener(() {
      if (_passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isEmpty) {
        _confirmPasswordController.text = _passwordController.text;
      }
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    final authProvider = context.read<AuthProvider>();

    try {
      await authProvider.registerWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );

      if (mounted) {
        Constant.moveToNext(
          context,
          EmailVerificationSentView(email: _emailController.text.trim()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? 'Sign up failed'),
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
                horizontal: FetchPixels.getPixelWidth(25),
                vertical: FetchPixels.getPixelHeight(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  getVerSpace(30),
                  Image.asset(
                    R.images.appLogo,
                    scale: FetchPixels.getScale(),
                    height: FetchPixels.getPixelHeight(150),
                  ),
                  getVerSpace(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      simpleText(
                        "Create account and get your",
                        style: R.textStyle.mediumInter().copyWith(fontSize: 16),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(R.icons.dollarNoteIcon, height: 30),
                          simpleText(
                            " digital finance assistant ✨",
                            style: R.textStyle.boldInter().copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  getVerSpace(20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getTextFieldText("First Name"),
                          getVerSpace(10),
                          MyTextField(
                            controller: _firstNameController,
                            textFormFieldWidth: 160,
                            prefixSvgIconPath: R.icons.profileIcon,
                            prefixSvgIconColor: R.colors.iconColor,
                            prefixSvgIconSize: 23,
                            context: context,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your first name';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      getHorSpace(15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getTextFieldText("Last Name"),
                          getVerSpace(10),
                          MyTextField(
                            controller: _lastNameController,
                            textFormFieldWidth: 160,
                            prefixSvgIconPath: R.icons.profileIcon,
                            prefixSvgIconColor: R.colors.iconColor,
                            prefixSvgIconSize: 23,
                            context: context,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your last name';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  getVerSpace(20),
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
                  getVerSpace(20),
                  getTextFieldText("Create Password"),
                  getVerSpace(10),
                  MyTextField(
                    controller: _passwordController,
                    prefixSvgIconPath: R.icons.passwordIcon,
                    moveNext: false,
                    showButton: true,
                    eyeIconNumber: 4,
                    eyeIconAllowNumber: 4,
                    autofillHints: const [AutofillHints.newPassword],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        authProvider.changeEyeIconAllow(number: 4, value: true);
                      } else {
                        authProvider.changeEyeIconAllow(
                          number: 4,
                          value: false,
                        );
                      }
                    },
                    onTapEyeButton: () {
                      authProvider.changeEyeIcon(number: 4);
                    },
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      if (!value.contains(RegExp(r'[A-Z]'))) {
                        return 'Password must contain at least one uppercase letter';
                      }
                      if (!value.contains(RegExp(r'[a-z]'))) {
                        return 'Password must contain at least one lowercase letter';
                      }
                      if (!value.contains(RegExp(r'[0-9]'))) {
                        return 'Password must contain at least one number';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(20),
                  getTextFieldText("Confirm Password"),
                  getVerSpace(10),
                  MyTextField(
                    controller: _confirmPasswordController,
                    prefixSvgIconPath: R.icons.passwordIcon,
                    moveNext: false,
                    showButton: true,
                    eyeIconNumber: 5,
                    eyeIconAllowNumber: 5,
                    autofillHints: const [AutofillHints.newPassword],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        authProvider.changeEyeIconAllow(number: 5, value: true);
                      } else {
                        authProvider.changeEyeIconAllow(
                          number: 5,
                          value: false,
                        );
                      }
                    },
                    onTapEyeButton: () {
                      authProvider.changeEyeIcon(number: 5);
                    },
                    context: context,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      return null;
                    },
                  ),
                  getVerSpace(30),
                  MyButton(
                    buttonText: authProvider.isLoading
                        ? "Signing up..."
                        : "Sign up",
                    onTap: () {
                      if (!authProvider.isLoading) {
                        _handleSignUp();
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
                        "Already have an account?",
                        style: R.textStyle.regularInter().copyWith(
                          fontSize: 14.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Constant.navigateToRoute(context, Routes.signIn);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: FetchPixels.getPixelHeight(15),
                            horizontal: FetchPixels.getPixelWidth(5),
                          ),

                          child: simpleText(
                            "Sign in",
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
                  getVerSpace(20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
