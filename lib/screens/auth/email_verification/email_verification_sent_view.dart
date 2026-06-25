import "dart:async";

import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/provider/auth_provider.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:provider/provider.dart";

import "../../../resources/resources.dart";

class EmailVerificationSentView extends StatefulWidget {
  final String email;

  const EmailVerificationSentView({super.key, required this.email});

  @override
  State<EmailVerificationSentView> createState() =>
      _EmailVerificationSentViewState();
}

class _EmailVerificationSentViewState extends State<EmailVerificationSentView> {
  bool _canResend = true;
  int _resendCooldown = 60;
  Timer? _resendTimer;

  @override
  void dispose() {
    _resendTimer?.cancel();
    super.dispose();
  }

  void _startResendCooldown() {
    setState(() {
      _canResend = false;
      _resendCooldown = 60;
    });

    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }
      setState(() {
        _resendCooldown--;
        if (_resendCooldown <= 0) {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  Future<void> _handleResendEmail() async {
    if (!_canResend) return;

    final authProvider = context.read<AuthProvider>();

    try {
      await authProvider.sendEmailVerification();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Verification email sent successfully'),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 3),
          ),
        );
        _startResendCooldown();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              authProvider.errorMessage ?? 'Failed to resend email',
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  Future<void> _handleCheckVerification() async {
    final authProvider = context.read<AuthProvider>();

    try {
      // Check if user is signed in first
      if (!authProvider.isAuthenticated) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Please sign in first to check email verification status.',
              ),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 4),
            ),
          );
        }
        return;
      }

      // Directly reload the Firebase user object
      await authProvider.reloadUser();

      // Add a longer delay to ensure Firebase has processed the verification
      await Future.delayed(const Duration(seconds: 3));

      // Reload again to be absolutely sure
      await authProvider.reloadUser();

      // Check verification status directly from Firebase
      final isVerified = authProvider.isEmailVerified;

      if (mounted) {
        if (isVerified) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email verified successfully!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 3),
            ),
          );
          Constant.navigateToRoute(context, Routes.signIn);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Email not yet verified. Please click the verification link in your email, wait 5-10 seconds, then try again.',
              ),
              backgroundColor: Colors.orange,
              duration: Duration(seconds: 6),
            ),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error checking verification: ${authProvider.errorMessage ?? e.toString()}',
            ),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 4),
          ),
        );
      }
    }
  }

  String _maskEmail(String email) {
    final parts = email.split('@');
    if (parts.length != 2) return email;

    final username = parts[0];
    final domain = parts[1];

    if (username.length <= 2) {
      return '${username[0]}***@$domain';
    }

    return '${username.substring(0, 2)}***@$domain';
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
            child: MyAppBar1(titleText: "Verify Email", titleFontSize: 19),
          ),
          Expanded(
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
                      getVerSpace(60),
                      SvgPicture.asset(
                        R.icons.mailIcon,
                        height: 100,
                        width: 100,
                      ),
                      getVerSpace(30),
                      simpleText(
                        "Verify Your Email",
                        style: R.textStyle.boldInter().copyWith(
                          fontSize: 24,
                          color: R.colors.primaryColor,
                        ),
                      ),
                      getVerSpace(20),
                      simpleText(
                        "We've sent a verification link to",
                        style: R.textStyle.mediumInter().copyWith(fontSize: 16),
                      ),
                      getVerSpace(5),
                      simpleText(
                        _maskEmail(widget.email),
                        style: R.textStyle.semiBoldInter().copyWith(
                          fontSize: 18,
                          color: R.colors.primaryColor,
                        ),
                      ),
                      getVerSpace(15),
                      simpleText(
                        "Please check your inbox and click the link to verify your account.",
                        style: R.textStyle.regularInter().copyWith(
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      getVerSpace(40),
                      MyButton(
                        buttonText: authProvider.isLoading
                            ? "Checking..."
                            : "I've Verified My Email",
                        onTap: () {
                          if (!authProvider.isLoading) {
                            _handleCheckVerification();
                          }
                        },
                      ),
                      getVerSpace(20),
                      MyButton(
                        buttonText: _canResend
                            ? "Resend Email"
                            : "Resend in $_resendCooldown",
                        onTap: () {
                          if (_canResend && !authProvider.isLoading) {
                            _handleResendEmail();
                          }
                        },
                      ),
                      getVerSpace(30),
                      TextButton(
                        onPressed: () {
                          Constant.navigateToRoute(context, Routes.signIn);
                        },
                        child: simpleText(
                          "Back to Sign In",
                          style: R.textStyle.mediumInter().copyWith(
                            fontSize: 16,
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
        ],
      ),
    );
  }
}
