import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/screens/auth/password_forget/enter_new_password.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:pinput/pinput.dart";

import "../../../base/resizer/fetch_pixels.dart";
import "../../../base/resizer/widget_utils.dart";
import "../../../resources/resources.dart";
import "../../../widgets/my_app_bar.dart";

class Verification extends StatelessWidget {
  final Widget moveNextScreen;

  const Verification({super.key, required this.moveNextScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(25),
            vertical: FetchPixels.getPixelHeight(20),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                getVerSpace(40),
                MyAppBar(),
                getVerSpace(35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(R.icons.profileIcon),
                    getHorSpace(5),
                    simpleText(
                      "Verify it’s You",
                      style: R.textStyle.boldInter().copyWith(
                        fontSize: 18,
                        color: R.colors.primaryColor,
                      ),
                    ),
                  ],
                ),

                getVerSpace(15),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      simpleText(
                        "We have sent a verification code to the email",
                        style: R.textStyle.regularInter().copyWith(
                          fontSize: 15,
                        ),
                      ),
                      simpleText(
                        "markro***@gmail.com.",
                        style: R.textStyle.semiBoldInter().copyWith(
                          fontSize: 15,
                        ),
                      ),
                      getVerSpace(20),
                      simpleText(
                        "Enter that code here to continue.",
                        style: R.textStyle.regularInter().copyWith(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                getVerSpace(25),
                Pinput(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  autofocus: true,
                  length: 4,
                  defaultPinTheme: getPinTheme(),
                  focusedPinTheme: getPinTheme(color: R.colors.primaryColor),
                  errorPinTheme: getPinTheme(color: R.colors.redColor),
                ),

                getVerSpace(20),
                getSimpleRichText([
                  TextSpan(
                    text: "Code didn’t received? ",
                    style: R.textStyle.regularInter().copyWith(fontSize: 14),
                  ),
                  TextSpan(
                    text: "Resend",
                    style: R.textStyle.semiBoldInter().copyWith(
                      fontSize: 15,
                      color: R.colors.primaryColor,
                      decoration: TextDecoration.underline,
                      decorationColor: R.colors.primaryColor,
                    ),
                  ),
                ]),
                getVerSpace(20),
                MyButton(
                  buttonText: "Continue",
                  onTap: () {
                    Constant.moveToNext(context, moveNextScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
