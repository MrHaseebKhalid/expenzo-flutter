import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../base/resizer/fetch_pixels.dart";
import "../../../resources/resources.dart";

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getVerSpace(150),
                Image.asset(
                  R.images.appLogo,
                  scale: FetchPixels.getScale(),
                  height: FetchPixels.getPixelHeight(150),
                ),
                getSimpleRichText([
                  TextSpan(
                    text: "WELCOME TO ",
                    style: R.textStyle.boldInter().copyWith(
                      fontSize: 14.5,
                      letterSpacing: 3.0,
                    ),
                  ),
                  TextSpan(
                    text: R.strings.appName.toUpperCase(),
                    style: R.textStyle.boldInter().copyWith(
                      fontSize: 14.5,
                      color: R.colors.primaryColor,
                      letterSpacing: 3.0,
                    ),
                  ),
                ]),
                getVerSpace(25),
                Padding(
                  padding: EdgeInsets.only(
                    left: FetchPixels.getPixelWidth(28)
                  ),
                  child: getSimpleRichText([
                    TextSpan(
                      text: "“",
                      style: R.textStyle.boldInter().copyWith(fontSize: 14.5),
                    ),
                    TextSpan(
                      text:
                          "Discover Expenzo – take control of your finances. ",
                      style: R.textStyle.regularInter().copyWith(fontSize: 14.5),
                    ),
                    TextSpan(
                      text: "Track Smarter. Spend Better.”",
                      style: R.textStyle.boldInter().copyWith(fontSize: 14.5),
                    ),
                  ]),
                ),

                getVerSpace(320),
                MyButton(buttonText: "Let’s Go", onTap: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
