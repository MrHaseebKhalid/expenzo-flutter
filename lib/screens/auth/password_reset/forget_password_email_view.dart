import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/screens/auth/password_reset/enter_new_password_view.dart";
import "package:expenzo/screens/auth/widgets/verification.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:expenzo/widgets/my_text_field.dart";
import "package:flutter/material.dart";

import "../../../resources/resources.dart";

class ForgetPasswordEmailView extends StatelessWidget {
  const ForgetPasswordEmailView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        showText: "example@gmail.com",
                        prefixSvgIconPath: R.icons.mailIcon,
                        onTapEyeButton: () {},
                        context: context,
                        validator: (value) {
                          return null;
                        },
                      ),

                      getVerSpace(50),

                      MyButton(
                        buttonText: "Continue",
                        onTap: () {
                          Constant.moveToNext(
                            context,
                            Verification(
                              nextScreen: const EnterNewPasswordView(),
                            ),
                          );
                        },
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
