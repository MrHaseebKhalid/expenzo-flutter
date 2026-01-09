import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "../resources/resources.dart";

class MyBackButton extends StatelessWidget {
  final GestureTapCallback onTap;

  const MyBackButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: FetchPixels.getPixelWidth(60),
        height: FetchPixels.getPixelHeight(50),
        
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(15),
          vertical: FetchPixels.getPixelHeight(15),
        ),
        decoration: BoxDecoration(
          color: R.colors.lightGreyColor,
          borderRadius: BorderRadius.circular(FetchPixels.getPixelHeight(10)),
        ),
        child: SvgPicture.asset(R.icons.backArrowIcon),
      ),
    );
  }
}
