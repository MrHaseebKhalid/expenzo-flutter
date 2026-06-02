import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

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
              borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(12)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(2)),
              child: Row(
                mainAxisAlignment: isEnabled ? MainAxisAlignment.end : MainAxisAlignment.start,
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
                Icon(
                  Icons.keyboard_arrow_down,
                  size: FetchPixels.getPixelHeight(18),
                  color: R.colors.primaryColor,
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
          _buildCustomSwitch(
            isEnabled: isEnabled,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationCard({
    required String title,
    VoidCallback? onTap,
  }) {
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
            Icon(
              Icons.arrow_forward_ios,
              size: FetchPixels.getPixelHeight(14),
              color: R.colors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(
          onTap: () => Navigator.pop(context),
        ),
        title: simpleText(
          "Notifications",
          style: R.textStyle.boldInter().copyWith(
            fontSize: 20,
            color: R.colors.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: R.colors.bgColor,
      ),
      backgroundColor: R.colors.bgColor,
      body: SingleChildScrollView(
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
                Icon(
                  Icons.trending_up,
                  color: R.colors.secondaryColor,
                  size: FetchPixels.getPixelHeight(18),
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
            ),
            getVerSpace(30),
          ],
        ),
      ),
    );
  }
}
