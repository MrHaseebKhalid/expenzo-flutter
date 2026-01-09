import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/screens/auth/provider/auth_provider.dart";
import "package:expenzo/screens/auth/sign%20in/sign_in.dart";
import "package:expenzo/screens/auth/widgets/confirmation.dart";
import "package:expenzo/screens/auth/widgets/verification.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:provider/provider.dart";

import "../../../base/resizer/constant.dart";
import "../../../resources/resources.dart";
import "../../../widgets/my_text_field.dart";

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.read<AuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                          style: R.textStyle.boldInter().copyWith(fontSize: 16),
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
                          textFormFieldWidth: 160,
                          prefixSvgIconPath: R.icons.profileIcon,
                          prefixSvgIconColor: R.colors.iconColor,
                          prefixSvgIconSize: 23,
                          context: context,
                          validator: (value) {},
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
                          textFormFieldWidth: 160,
                          prefixSvgIconPath: R.icons.profileIcon,
                          prefixSvgIconColor: R.colors.iconColor,
                          prefixSvgIconSize: 23,
                          context: context,
                          validator: (value) {},
                        ),
                      ],
                    ),
                  ],
                ),
                getVerSpace(20),
                getTextFieldText("Email Address"),
                getVerSpace(10),
                MyTextField(
                  showText: "example@gmail.com",
                  prefixSvgIconPath: R.icons.mailIcon,
                  context: context,
                  validator: (value) {},
                ),
                getVerSpace(20),
                getTextFieldText("Create Password"),
                getVerSpace(10),
                MyTextField(
                  prefixSvgIconPath: R.icons.passwordIcon,
                  moveNext: false,
                  showButton: true,
                  eyeIconNumber: 4,
                  eyeIconAllowNumber: 4,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      authProvider.changeEyeIconAllow(number: 4, value: true);
                    } else {
                      authProvider.changeEyeIconAllow(number: 4, value: false);
                    }
                  },
                  onTapEyeButton: () {
                    authProvider.changeEyeIcon(number: 4);
                  },
                  context: context,
                  validator: (value) {},
                ),
                getVerSpace(20),
                getTextFieldText("Confirm Password"),
                getVerSpace(10),
                MyTextField(
                  prefixSvgIconPath: R.icons.passwordIcon,
                  moveNext: false,
                  showButton: true,
                  eyeIconNumber: 5,
                  eyeIconAllowNumber: 5,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      authProvider.changeEyeIconAllow(number: 5, value: true);
                    } else {
                      authProvider.changeEyeIconAllow(number: 5, value: false);
                    }
                  },
                  onTapEyeButton: () {
                    authProvider.changeEyeIcon(number: 5);
                  },
                  context: context,
                  validator: (value) {},
                ),
                getVerSpace(30),
                MyButton(
                  buttonText: "Sign up",
                  onTap: () {
                    Constant.moveToNext(
                      context,
                      Verification(
                        moveNextScreen: Confirmation(
                          mainText: "You have created your account.",
                          buttonText: "Redirect to Sign in",
                          moveNextScreen: SignIn(),
                          subRichTextChildren: [
                            TextSpan(
                              text: "Now, you can sign in to ",
                              style: R.textStyle.mediumInter().copyWith(
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: "Expenzo.",
                              style: R.textStyle.semiBoldInter().copyWith(
                                fontSize: 16,
                                color: R.colors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
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
                        Constant.moveToNext(context, SignIn());
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
    );
  }
}
