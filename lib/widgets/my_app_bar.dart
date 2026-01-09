import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:flutter/material.dart";

import "../resources/resources.dart";

class MyAppBar extends StatelessWidget {
  final String? titleText;
  final double? titleFontSize;

  const MyAppBar({super.key, this.titleText, this.titleFontSize});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MyBackButton(
          onTap: () {
            Constant.backToPrev(context);
          },
        ),
        getHorSpace(20),
        if(titleText != null) simpleText(titleText!,
        style: R.textStyle.boldInter().copyWith(
          color: R.colors.primaryColor,
          fontSize: titleFontSize ?? 18,
        ),
        ),
      ],
    );
  }
}
