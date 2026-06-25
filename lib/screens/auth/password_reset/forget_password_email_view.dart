import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/provider/auth_provider.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:expenzo/widgets/my_text_field.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../../resources/resources.dart";

class ForgetPasswordEmailView extends StatefulWidget {
  const ForgetPasswordEmailView({super.key});

  @override
  State<ForgetPasswordEmailView> createState() =>
      _ForgetPasswordEmailViewState();
}

class _ForgetPasswordEmailViewState extends State<ForgetPasswordEmailView> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleSendResetEmail() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final authProvider = context.read<AuthProvider>();

    try {
      await authProvider.sendPasswordResetEmail(_emailController.text.trim());

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'If this email exists in our system, you\'ll receive a password reset link shortly. Click the link to reset your password.',
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 6),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              authProvider.errorMessage ?? 'Failed to send reset email',
            ),
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
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: FetchPixels.getPixelHeight(10),
              left: FetchPixels.getPixelWidth(20),
              bottom: FetchPixels.getPixelHeight(10),
            ),
            child: MyAppBar1(titleText: "Forget Password", titleFontSize: 19),
          ),
          Expanded(
            child: Form(
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
                        Padding(
                          padding: EdgeInsets.only(
                            right: FetchPixels.getPixelWidth(60),
                          ),
                          child: getSimpleRichText([
                            TextSpan(text: "Enter your "),
                            TextSpan(
                              text: R.strings.appName,
                              style: R.textStyle.semiBoldInter().copyWith(
                                color: R.colors.primaryColor,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(text: " account email to reset password."),
                          ]),
                        ),

                        getVerSpace(40),
                        getTextFieldText("Email Address"),
                        getVerSpace(10),
                        MyTextField(
                          controller: _emailController,
                          showText: "example@gmail.com",
                          prefixSvgIconPath: R.icons.mailIcon,
                          onTapEyeButton: () {},
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

                        getVerSpace(50),

                        MyButton(
                          buttonText: authProvider.isLoading
                              ? "Sending..."
                              : "Continue",
                          onTap: () {
                            if (!authProvider.isLoading) {
                              _handleSendResetEmail();
                            }
                          },
                        ),

                        getVerSpace(20),

                        TextButton(
                          onPressed: () {
                            Constant.navigateToRoute(context, Routes.signIn);
                          },
                          child: simpleText(
                            "I've clicked the link in my email - Go to Sign In",
                            style: R.textStyle.mediumInter().copyWith(
                              fontSize: 14,
                              color: R.colors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
