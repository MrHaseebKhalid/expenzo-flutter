import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Widget _buildMenuItem({
    String svgIconPath = "",
    IconData? icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(12),
          vertical: FetchPixels.getPixelHeight(12),
        ),
        margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
        child: Row(
          children: [
            Container(
              padding: svgIconPath == ""
                  ? EdgeInsets.zero
                  : EdgeInsets.all(FetchPixels.getPixelWidth(12)),
              width: FetchPixels.getPixelWidth(45),
              height: FetchPixels.getPixelHeight(45),
              decoration: BoxDecoration(
                color: R.colors.primaryColor.withValues(
                  alpha: Constant.getOpacityValues(10),
                ),
                borderRadius: BorderRadius.circular(
                  FetchPixels.getPixelWidth(12),
                ),
              ),
              child: (svgIconPath != "")
                  ? SvgPicture.asset(
                      svgIconPath,

                      fit: BoxFit.contain,
                      width: FetchPixels.getPixelWidth(22),
                      // height: FetchPixels.getPixelHeight(22),
                      colorFilter: ColorFilter.mode(
                        R.colors.primaryColor,
                        BlendMode.srcIn,
                      ),
                    )
                  : Icon(
                      icon,
                      size: FetchPixels.getPixelHeight(22),
                      color: R.colors.primaryColor,
                    ),
            ),
            getHorSpace(15),
            Expanded(
              child: simpleText(
                title,
                style: R.textStyle.semiBoldInter().copyWith(fontSize: 15),
              ),
            ),
            SvgPicture.asset(
              R.icons.forwardArrowIcon,
              width: FetchPixels.getPixelWidth(14),
              height: FetchPixels.getPixelHeight(14),
              colorFilter: ColorFilter.mode(
                R.colors.dimTextColor,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        getVerSpace(20),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: FetchPixels.getPixelWidth(100),
              height: FetchPixels.getPixelHeight(100),
              decoration: BoxDecoration(
                border: Border.all(color: R.colors.primaryColor, width: 1.5),
                shape: BoxShape.circle,
                color: R.colors.lightGreyColor,
              ),
              child: Icon(
                Icons.person,
                size: FetchPixels.getPixelHeight(50),
                color: R.colors.dimTextColor,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: FetchPixels.getPixelWidth(32),
                height: FetchPixels.getPixelHeight(32),
                decoration: BoxDecoration(
                  color: R.colors.primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: R.colors.whiteColor, width: 2),
                ),
                child: Icon(
                  Icons.edit,
                  size: FetchPixels.getPixelHeight(16),
                  color: R.colors.whiteColor,
                ),
              ),
            ),
          ],
        ),
        getVerSpace(15),
        simpleText(
          "Mark Rober",
          style: R.textStyle.boldInter().copyWith(
            fontSize: 22,
            color: R.colors.textColor,
          ),
        ),
        getVerSpace(5),
        simpleText(
          "markrober@gmail.com",
          style: R.textStyle.mediumInter().copyWith(
            fontSize: 14,
            color: R.colors.dimTextColor,
          ),
        ),
        getVerSpace(30),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMenuItem(
                icon: Icons.person_outline,
                title: "Personal Info",
                onTap: () {
                  Constant.navigateToRoute(context, Routes.personalInfo);
                },
              ),
              _buildMenuItem(
                icon: Icons.account_circle_outlined,
                title: "Account details",
                onTap: () {
                  Constant.navigateToRoute(context, Routes.accountDetails);
                },
              ),
              _buildMenuItem(
                svgIconPath: R.icons.notificationBellIcon,
                title: "Notifications",
                onTap: () {
                  Constant.navigateToRoute(context, Routes.notifications);
                },
              ),
              _buildMenuItem(
                svgIconPath: R.icons.settingsIcon,
                title: "Settings",
                onTap: () {
                  Constant.navigateToRoute(context, Routes.settings);
                },
              ),
              _buildMenuItem(
                icon: Icons.help_outline,
                title: "FAQs",
                onTap: () {
                  Constant.navigateToRoute(context, Routes.faqs);
                },
              ),
            ],
          ),
        ),
        getVerSpace(60),
      ],
    );
  }
}
