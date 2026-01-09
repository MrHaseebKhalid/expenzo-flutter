import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/widgets/my_button.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../../../resources/resources.dart";

class Confirmation extends StatelessWidget {
  final String mainText;
  final List<InlineSpan> subRichTextChildren;
  final String buttonText;
  final Widget moveNextScreen;

  const Confirmation({
    super.key,
    required this.mainText,
    required this.buttonText,
    required this.moveNextScreen,
    required this.subRichTextChildren,
  });

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
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                getVerSpace(120),
                SvgPicture.asset(R.icons.tickIcon,
                height: 90,
                ),

                getVerSpace(30),
                simpleText(
                  "Congratulations! 👏✨",
                  style: R.textStyle.semiBoldInter().copyWith(fontSize: 19),
                ),
                getVerSpace(20),
                simpleText(mainText,
                style: R.textStyle.mediumInter().copyWith(
                  fontSize: 14
                )
                ),
                getVerSpace(10),
                getSimpleRichText(subRichTextChildren),
                getVerSpace(350),
                MyButton(
                  buttonText: buttonText,
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
