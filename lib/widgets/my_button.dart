import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:flutter/material.dart";

import "../resources/resources.dart";

class MyButton extends StatelessWidget {
  final String buttonText;
  final GestureTapCallback onTap;

  const MyButton({super.key, required this.buttonText, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: FetchPixels.getPixelHeight(55),
        width: FetchPixels.getPixelWidth(340),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: R.colors.primaryColor,
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(100)),
        ),
        child: simpleText(
          buttonText,
          style: R.textStyle.boldInter().copyWith(
            color: R.colors.whiteTextColor,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
