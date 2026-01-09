import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/screens/auth/Sign%20up/sign_up.dart";
import "package:expenzo/screens/auth/initialize/initial_details.dart";
import "package:expenzo/screens/auth/password_forget/forget_password_email.dart";
import "package:expenzo/screens/auth/provider/auth_provider.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:expenzo/widgets/my_text_field.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../../resources/resources.dart";

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    var authProvider = context.read<AuthProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
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
                  showText: "example@gmail.com",
                  prefixSvgIconPath: R.icons.mailIcon,
                  context: context,
                  validator: (value) {},
                ),
                getVerSpace(30),
                getTextFieldText("Password"),
                getVerSpace(10),
                MyTextField(
                  prefixSvgIconPath: R.icons.passwordIcon,
                  moveNext: false,
                  showButton: true,
                  eyeIconNumber: 1,
                  eyeIconAllowNumber: 1,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      authProvider.changeEyeIconAllow(number: 1, value: true);
                    } else {
                      authProvider.changeEyeIconAllow(number: 1, value: false);
                    }
                  },
                  onTapEyeButton: () {
                    authProvider.changeEyeIcon(number: 1);
                  },
                  context: context,
                  validator: (value) {},
                ),
                getVerSpace(5),

                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Constant.moveToNext(context, ForgetPasswordEmail());
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
                MyButton(buttonText: "Sign in", onTap: () {
                  Constant.moveToNext(context, InitialDetails());
                }),

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
                        Constant.moveToNext(context, SignUp());
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: FetchPixels.getPixelHeight(15),
                            horizontal: FetchPixels.getPixelWidth(5)
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
    );
  }
}
