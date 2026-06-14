import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class NotificationsView extends StatefulWidget {
  const NotificationsView({super.key});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  bool updatesEnabled = false;
  bool notificationsEnabled = true;
  bool inAppNotificationsEnabled = true;

  Widget _buildCustomSwitch({
    required bool isEnabled,
    required ValueChanged<bool> onChanged,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        simpleText(
          "off",
          style: R.textStyle.mediumInter().copyWith(
            fontSize: 12,
            color: isEnabled ? R.colors.dimTextColor : R.colors.textColor,
          ),
        ),
        getHorSpace(8),
        GestureDetector(
          onTap: () => onChanged(!isEnabled),
          child: Container(
            width: FetchPixels.getPixelWidth(40),
            height: FetchPixels.getPixelHeight(24),
            decoration: BoxDecoration(
              color: isEnabled ? R.colors.primaryColor : R.colors.transparent,
              border: Border.all(
                color: isEnabled ? R.colors.primaryColor : R.colors.textColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(
                FetchPixels.getPixelWidth(12),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(2),
              ),
              child: Row(
                mainAxisAlignment: isEnabled
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                    width: FetchPixels.getPixelWidth(18),
                    height: FetchPixels.getPixelHeight(18),
                    decoration: BoxDecoration(
                      color: isEnabled ? R.colors.bgColor : R.colors.textColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        getHorSpace(8),
        simpleText(
          "on",
          style: R.textStyle.mediumInter().copyWith(
            fontSize: 12,
            color: isEnabled ? R.colors.textColor : R.colors.dimTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownCard({
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
        borderRadius: 10,
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(15),
          vertical: FetchPixels.getPixelHeight(15),
        ),
        margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            simpleText(
              title,
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 15),
            ),
            Row(
              children: [
                simpleText(
                  value,
                  style: R.textStyle.mediumInter().copyWith(
                    fontSize: 13,
                    color: R.colors.dimTextColor,
                  ),
                ),
                getHorSpace(8),
                SvgPicture.asset(
                  R.icons.downArrowIcon,
                  width: FetchPixels.getPixelWidth(8),
                  height: FetchPixels.getPixelHeight(8),
                  colorFilter: ColorFilter.mode(
                    R.colors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleCard({
    required String title,
    required bool isEnabled,
    required ValueChanged<bool> onChanged,
  }) {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(15),
        vertical: FetchPixels.getPixelHeight(15),
      ),
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          simpleText(
            title,
            style: R.textStyle.semiBoldInter().copyWith(fontSize: 15),
          ),
          _buildCustomSwitch(isEnabled: isEnabled, onChanged: onChanged),
        ],
      ),
    );
  }

  Widget _buildNavigationCard({required String title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(15),
          vertical: FetchPixels.getPixelHeight(15),
        ),
        margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            simpleText(
              title,
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 15),
            ),
            SvgPicture.asset(
              R.icons.forwardArrowIcon,
              width: FetchPixels.getPixelWidth(14),
              height: FetchPixels.getPixelHeight(14),
              colorFilter: ColorFilter.mode(
                R.colors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.colors.bgColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: FetchPixels.getPixelHeight(10),
              left: FetchPixels.getPixelWidth(20),
              bottom: FetchPixels.getPixelHeight(10),
            ),
            child: MyAppBar1(titleText: "Notifications", titleFontSize: 19),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(20),
                vertical: FetchPixels.getPixelHeight(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      simpleText(
                        "Customize your finance notifications",
                        style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                      ),
                      getHorSpace(5),
                      SvgPicture.asset(
                        R.icons.financeNotificationLineIcon,

                        width: FetchPixels.getPixelWidth(18),
                        height: FetchPixels.getPixelHeight(18),
                      ),
                    ],
                  ),
                  getVerSpace(25),
                  _buildDropdownCard(
                    title: "Remainder time",
                    value: "11:00 am (Default)",
                  ),
                  _buildDropdownCard(
                    title: "Remainder Frequency",
                    value: "Daily (Default)",
                  ),
                  _buildDropdownCard(
                    title: "Budget Alerts",
                    value: "When its 90% Full",
                  ),
                  _buildDropdownCard(
                    title: "Expenses Alerts",
                    value: "when near exceeding...",
                  ),
                  getVerSpace(10),
                  _buildToggleCard(
                    title: "Updates",
                    isEnabled: updatesEnabled,
                    onChanged: (value) {
                      setState(() {
                        updatesEnabled = value;
                      });
                    },
                  ),
                  _buildToggleCard(
                    title: "Notifications",
                    isEnabled: notificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        notificationsEnabled = value;
                      });
                    },
                  ),
                  _buildToggleCard(
                    title: "In-App Notifications",
                    isEnabled: inAppNotificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        inAppNotificationsEnabled = value;
                      });
                    },
                  ),
                  getVerSpace(10),
                  _buildNavigationCard(
                    title: "Reminders",
                    onTap: () {
                      Constant.navigateToRoute(context, Routes.reminders);
                    },
                  ),
                  getVerSpace(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
