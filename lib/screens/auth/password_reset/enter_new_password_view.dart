import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/provider/auth_provider.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../resources/resources.dart";
import "../../../widgets/my_text_field.dart";

class EnterNewPasswordView extends StatefulWidget {
  final String? oobCode;

  const EnterNewPasswordView({super.key, this.oobCode});

  @override
  State<EnterNewPasswordView> createState() => _EnterNewPasswordViewState();
}

class _EnterNewPasswordViewState extends State<EnterNewPasswordView> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleResetPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_newPasswordController.text != _confirmPasswordController.text) {
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
      if (widget.oobCode != null) {
        // Use the oobCode from the email link (deep link flow)
        await authProvider.confirmPasswordReset(
          code: widget.oobCode!,
          newPassword: _newPasswordController.text,
        );

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Password reset successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ),
          );

          Constant.navigateToRoute(context, Routes.signIn);
        }
      } else {
        // No oobCode provided - user needs to click the link from email
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please click the password reset link from your email to reset your password.',
            ),
            backgroundColor: Colors.orange,
            duration: Duration(seconds: 5),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(authProvider.errorMessage ?? 'Password reset failed'),
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
            child: MyAppBar1(
              titleText: "Enter New Password",
              titleFontSize: 19,
            ),
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
                        Image.asset(R.images.enterNewPasswordImage),
                        getVerSpace(20),
                        simpleText(
                          "Enter a strong password different from the previous one.",
                        ),
                        getVerSpace(20),
                        getTextFieldText("New Password"),
                        getVerSpace(10),
                        MyTextField(
                          controller: _newPasswordController,
                          prefixSvgIconPath: R.icons.passwordIcon,
                          moveNext: false,
                          showButton: true,
                          eyeIconNumber: 2,
                          eyeIconAllowNumber: 2,
                          autofillHints: const [AutofillHints.newPassword],
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              authProvider.changeEyeIconAllow(
                                number: 2,
                                value: true,
                              );
                            } else {
                              authProvider.changeEyeIconAllow(
                                number: 2,
                                value: false,
                              );
                            }
                          },
                          onTapEyeButton: () {
                            authProvider.changeEyeIcon(number: 2);
                          },
                          context: context,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your new password';
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
                          eyeIconNumber: 3,
                          eyeIconAllowNumber: 3,
                          autofillHints: const [AutofillHints.newPassword],
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              authProvider.changeEyeIconAllow(
                                number: 3,
                                value: true,
                              );
                            } else {
                              authProvider.changeEyeIconAllow(
                                number: 3,
                                value: false,
                              );
                            }
                          },
                          onTapEyeButton: () {
                            authProvider.changeEyeIcon(number: 3);
                          },
                          context: context,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            }
                            if (value != _newPasswordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                        getVerSpace(40),
                        MyButton(
                          buttonText: authProvider.isLoading
                              ? "Resetting..."
                              : "Reset",
                          onTap: () {
                            if (!authProvider.isLoading) {
                              _handleResetPassword();
                            }
                          },
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
