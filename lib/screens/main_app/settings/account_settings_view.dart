import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  Widget _buildSettingTile({
    required String svgIconPath,
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
        borderRadius: 10,
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(20),
          vertical: FetchPixels.getPixelHeight(15),
        ),
        margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
        child: Row(
          children: [
            SvgPicture.asset(
              svgIconPath,
              width: FetchPixels.getPixelWidth(18),
              height: FetchPixels.getPixelHeight(18),
              colorFilter: ColorFilter.mode(
                iconColor ?? R.colors.primaryColor,
                BlendMode.srcIn,
              ),
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
            child: MyAppBar1(titleText: "Account settings", titleFontSize: 19),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(30),
                vertical: FetchPixels.getPixelHeight(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSettingTile(
                    svgIconPath: R.icons.profileIcon1,
                    title: "Edit Profile",
                    showChevron: true,
                    onTap: () {
                      Constant.navigateToRoute(context, Routes.editProfile);
                    },
                  ),
                  _buildSettingTile(
                    svgIconPath: R.icons.passwordIcon,
                    title: "Change Password",
                    showChevron: true,
                    onTap: () {},
                  ),
                  getVerSpace(15),
                  _buildSettingTile(
                    svgIconPath: R.icons.deleteIcon,
                    title: "Delete Account",
                    iconColor: R.colors.redColor,
                    titleColor: R.colors.redColor,
                    onTap: () {},
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
