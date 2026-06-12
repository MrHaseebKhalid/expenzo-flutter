import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class AccountDetailsView extends StatelessWidget {
  const AccountDetailsView({super.key});

  Widget _buildInfoCard({
    required String iconPath,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(20),
        vertical: FetchPixels.getPixelHeight(20),
      ),
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
      child: Row(
        children: [
          Container(
            width: FetchPixels.getPixelWidth(45),
            height: FetchPixels.getPixelHeight(45),
            decoration: BoxDecoration(
              color: R.colors.primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(
                FetchPixels.getPixelWidth(12),
              ),
            ),
            child: Center(
              child: SvgPicture.asset(
                iconPath,
                width: FetchPixels.getPixelWidth(22),
                height: FetchPixels.getPixelHeight(22),
                colorFilter: ColorFilter.mode(
                  R.colors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          getHorSpace(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                simpleText(
                  label,
                  style: R.textStyle.mediumInter().copyWith(
                    fontSize: 13,
                    color: R.colors.dimTextColor,
                  ),
                ),
                getVerSpace(4),
                simpleText(
                  value,
                  style: R.textStyle.boldInter().copyWith(
                    fontSize: 15,
                    color: valueColor ?? R.colors.textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
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
            child: MyAppBar1(titleText: "Account Details", titleFontSize: 19),
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
                  getVerSpace(20),
                  simpleText(
                    "Account Information",
                    style: R.textStyle.semiBoldInter().copyWith(fontSize: 17),
                  ),
                  getVerSpace(15),

                  _buildInfoCard(
                    iconPath: R.icons.parameterIcon,
                    label: "Account Status",
                    value: "Active",
                    valueColor: const Color(0xFF4CAF50),
                  ),
                  _buildInfoCard(
                    iconPath: R.icons.calenderIcon,
                    label: "Member Since",
                    value: "January 2025",
                  ),
                  _buildInfoCard(
                    iconPath: R.icons.mailIcon,
                    label: "Email",
                    value: "markrober@gmail.com",
                  ),
                  getVerSpace(30),

                  simpleText(
                    "Usage Statistics",
                    style: R.textStyle.semiBoldInter().copyWith(fontSize: 17),
                  ),
                  getVerSpace(15),
                  _buildInfoCard(
                    iconPath: R.icons.categoryIcon,
                    label: "Total Transactions",
                    value: "156",
                  ),
                  _buildInfoCard(
                    iconPath: R.icons.coinsIcon,
                    label: "Total Expenses Tracked",
                    value: "\$12,450.00",
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
