import "package:expenzo/base/resizer/widget_utils.dart";
import "package:flutter/material.dart";

import "../resources/resources.dart";

class MyAppBar2 extends StatelessWidget {
  final String titleText;
  final double? titleFontSize;
  final bool isSettingsIcon;
  final bool isBellIcon;

  const MyAppBar2({
    super.key,
    required this.titleText,
    this.titleFontSize,
    this.isSettingsIcon = false,
    this.isBellIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getVerSpace(35),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            simpleText(
              titleText,
              style: R.textStyle.boldInter().copyWith(
                color: R.colors.primaryColor,
                fontSize: titleFontSize ?? 21,
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isSettingsIcon)
                  circularIcon(iconPath: R.icons.settingsIcon, onTap: () {}),
                  getHorSpace(7),
                  if (isBellIcon)
                  circularIcon(
                    iconPath: R.icons.notificationBellIcon,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
