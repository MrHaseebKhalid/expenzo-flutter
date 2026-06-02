import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/screens/app/profile/pages/faqs_screen.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(20),
          vertical: FetchPixels.getPixelHeight(18),
        ),
        margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
        child: Row(
          children: [
            Container(
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
              child: Icon(
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
            Icon(
              Icons.arrow_forward_ios,
              size: FetchPixels.getPixelHeight(16),
              color: R.colors.dimTextColor,
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
      children: [
        getVerSpace(20),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: FetchPixels.getPixelWidth(100),
              height: FetchPixels.getPixelHeight(100),
              decoration: BoxDecoration(
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
          style: R.textStyle.boldInter().copyWith(fontSize: 22),
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
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.account_balance_wallet_outlined,
                title: "Finance details",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.account_circle_outlined,
                title: "Account details",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.notifications_outlined,
                title: "Notifications",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.file_download_outlined,
                title: "Export Data",
                onTap: () {},
              ),
              _buildMenuItem(
                icon: Icons.help_outline,
                title: "FAQs",
                onTap: () {
                  Constant.moveToNext(context, FAQsScreen());
                },
              ),
              _buildMenuItem(
                icon: Icons.info_outline,
                title: "About us",
                onTap: () {},
              ),
            ],
          ),
        ),
        getVerSpace(30),
      ],
    );
  }
}
