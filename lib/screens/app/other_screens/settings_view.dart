import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    String? value,
    bool showChevron = false,
    Color? iconColor,
    Color? titleColor,
    Color? valueColor,
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
          children: [
            Icon(
              icon,
              color: iconColor ?? R.colors.primaryColor,
              size: FetchPixels.getPixelHeight(24),
            ),
            getHorSpace(15),
            Expanded(
              child: simpleText(
                title,
                style: R.textStyle.semiBoldInter().copyWith(
                  fontSize: 15,
                  color: titleColor ?? R.colors.textColor,
                ),
              ),
            ),
            if (value != null) ...[
              simpleText(
                value,
                style: R.textStyle.mediumInter().copyWith(
                  fontSize: 14,
                  color: valueColor ?? R.colors.dimTextColor,
                ),
              ),
              getHorSpace(8),
            ],
            if (showChevron)
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
          "Settings",
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
            _buildSettingTile(
              icon: Icons.palette,
              title: "Theme",
              value: "Light",
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.currency_exchange,
              title: "Currency",
              value: "\$USD",
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.calendar_today,
              title: "Time format",
              value: "DD/MM/YYYY",
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.account_circle,
              title: "Account settings",
              showChevron: true,
              onTap: () {},
            ),
            _buildSettingTile(
              icon: Icons.security,
              title: "Security settings",
              showChevron: true,
              onTap: () {},
            ),
            getVerSpace(10),
            _buildSettingTile(
              icon: Icons.logout,
              title: "Logout",
              iconColor: R.colors.redColor,
              titleColor: R.colors.redColor,
              onTap: () {},
            ),
            getVerSpace(30),
          ],
        ),
      ),
    );
  }
}
