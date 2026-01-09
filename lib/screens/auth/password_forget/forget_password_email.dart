import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/screens/auth/password_forget/enter_new_password.dart";
import "package:expenzo/screens/auth/widgets/verification.dart";
import "package:expenzo/widgets/my_app_bar.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:expenzo/widgets/my_text_field.dart";
import "package:flutter/material.dart";

import "../../../resources/resources.dart";

class ForgetPasswordEmail extends StatelessWidget {
  const ForgetPasswordEmail({super.key});

  @override
  Widget build(BuildContext context) {
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
                getVerSpace(40),
                MyAppBar(),
                getVerSpace(35),
                Padding(
                  padding: EdgeInsets.only(
                    right: FetchPixels.getPixelWidth(60)
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
                  showText: "example@gmail.com",
                  prefixSvgIconPath: R.icons.mailIcon,
                  onTapEyeButton: () {},
                  context: context,
                  validator: (value) {},
                ),

                getVerSpace(50),

                MyButton(buttonText: "Continue", onTap: () {
                  Constant.moveToNext(context, Verification(
                    moveNextScreen: EnterNewPassword(),
                  ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
