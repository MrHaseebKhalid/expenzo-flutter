import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "../../resources/resources.dart";
import "../../widgets/my_text_field.dart";

class SubCategoryBox extends StatelessWidget {
  final String iconPath;
  final double iconSize;
  final String text;
  final double textSize;
  final Color textColor;
  final String hintText;

  const SubCategoryBox({
    super.key,
    required this.iconPath,
    required this.iconSize,
    required this.text,
    required this.textSize,
    required this.textColor,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        vertical: FetchPixels.getPixelHeight(15),
        horizontal: FetchPixels.getPixelWidth(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: FetchPixels.getPixelHeight(iconSize),
                ),
                getVerSpace(5),
                simpleText(
                  text,
                  style: R.textStyle.boldInter().copyWith(
                    fontSize: textSize,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
          MyTextField(
            textFormFieldWidth: FetchPixels.getPixelWidth(220),
            context: context,
            prefixSvgIconPath: R.icons.priceTagIcon,
            prefixSvgIconColor: R.colors.iconColor,
            prefixSvgIconSize: 22,
            showText: "e.g., \$$hintText",
            validator: (value) {},
          ),
        ],
      ),
    );
  }
}
