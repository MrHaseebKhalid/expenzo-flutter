import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:flutter/material.dart";

import "../resources/resources.dart";

class MyAppBar2 extends StatelessWidget implements PreferredSizeWidget {
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: R.colors.transparent,
      leadingWidth: 0.0,
      leading: getVerSpace(0),
      title: simpleText(
        titleText,
        style: R.textStyle.boldInter().copyWith(
          color: R.colors.primaryColor,
          fontSize: titleFontSize ?? 21,
        ),
      ),
      actionsPadding: EdgeInsets.only(right: FetchPixels.getPixelWidth(20)),
      actions: [
        if (isSettingsIcon)
          circularIcon(
            iconPath: R.icons.settingsIcon,
            onTap: () {
              Constant.navigateToRoute(context, '/settings');
            },
          ),
        if (isSettingsIcon && isBellIcon) getHorSpace(10),
        if (isBellIcon)
          circularIcon(
            iconPath: R.icons.notificationBellIcon,
            onTap: () {
              Constant.navigateToRoute(context, '/notifications');
            },
          ),
      ],
    );
  }
}
