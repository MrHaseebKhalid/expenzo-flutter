import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class BudgetDetailsView extends StatelessWidget {
  const BudgetDetailsView({super.key});

  Widget _buildCategoryCard({
    required String iconPath,
    required String name,
    required String amount,
    required String spent,
    required Color color,
    VoidCallback? onTap,
  }) {
    final double progress =
        double.tryParse(amount.replaceAll("\$", "")) != null &&
            double.tryParse(spent.replaceAll("\$", "")) != null
        ? (double.tryParse(spent.replaceAll("\$", ""))! /
                  double.tryParse(amount.replaceAll("\$", ""))!)
              .clamp(0.0, 1.0)
        : 0.0;

    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(15),
          vertical: FetchPixels.getPixelHeight(18),
        ),
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: FetchPixels.getPixelWidth(35),
                  height: FetchPixels.getPixelHeight(35),
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(
                      FetchPixels.getPixelWidth(12),
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      iconPath,
                      width: FetchPixels.getPixelWidth(20),
                      height: FetchPixels.getPixelHeight(20),
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),
                ),
                getHorSpace(10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      simpleText(
                        name,
                        style: R.textStyle.semiBoldInter().copyWith(
                          fontSize: 13,
                          color: color,
                        ),
                      ),
                      getVerSpace(4),
                      simpleText(
                        "Spent: $spent",
                        style: R.textStyle.mediumInter().copyWith(
                          fontSize: 12,
                          color: R.colors.dimTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            getVerSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                simpleText(
                  amount,
                  style: R.textStyle.boldInter().copyWith(
                    fontSize: 16,
                    color: R.colors.textColor,
                  ),
                ),
                simpleText(
                  "${(progress * 100).toInt()}%",
                  style: R.textStyle.semiBoldInter().copyWith(
                    fontSize: 12,
                    color: progress > 0.8
                        ? R.colors.redColor
                        : R.colors.primaryColor,
                  ),
                ),
              ],
            ),
            getVerSpace(8),
            Container(
              height: FetchPixels.getPixelHeight(4),
              decoration: BoxDecoration(
                color: R.colors.lightGreyColor,
                borderRadius: BorderRadius.circular(
                  FetchPixels.getPixelWidth(2),
                ),
              ),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: progress,
                child: Container(
                  decoration: BoxDecoration(
                    color: progress > 0.8 ? R.colors.redColor : color,
                    borderRadius: BorderRadius.circular(
                      FetchPixels.getPixelWidth(2),
                    ),
                  ),
                ),
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
            child: MyAppBar1(titleText: "Budget details", titleFontSize: 19),
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
                  simpleText(
                    "Track your budget spending",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 14,
                      color: R.colors.dimTextColor,
                    ),
                  ),
                  getVerSpace(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      simpleText(
                        "Your Budget",
                        style: R.textStyle.semiBoldInter().copyWith(
                          fontSize: 17,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: FetchPixels.getPixelHeight(20),
                            color: R.colors.primaryColor,
                          ),
                          getHorSpace(5),
                          simpleText(
                            "June 2024",
                            style: R.textStyle.semiBoldInter().copyWith(
                              fontSize: 14,
                              color: R.colors.primaryColor,
                            ),
                          ),
                          getHorSpace(3),
                          SvgPicture.asset(
                            R.icons.downArrowIcon,
                            width: FetchPixels.getPixelWidth(18),
                            height: FetchPixels.getPixelHeight(18),
                            colorFilter: ColorFilter.mode(
                              R.colors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  getVerSpace(20),
                  MyContainer(
                    padding: EdgeInsets.symmetric(
                      horizontal: FetchPixels.getPixelWidth(20),
                      vertical: FetchPixels.getPixelHeight(25),
                    ),
                    margin: EdgeInsets.zero,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            simpleText(
                              "Total Budget",
                              style: R.textStyle.mediumInter().copyWith(
                                fontSize: 13,
                                color: R.colors.dimTextColor,
                              ),
                            ),
                            getVerSpace(8),
                            simpleText(
                              "\$2,000",
                              style: R.textStyle.boldInter().copyWith(
                                fontSize: 24,
                                color: R.colors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: FetchPixels.getPixelWidth(1),
                          height: FetchPixels.getPixelHeight(50),
                          color: R.colors.lightGreyColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            simpleText(
                              "Total Spent",
                              style: R.textStyle.mediumInter().copyWith(
                                fontSize: 13,
                                color: R.colors.dimTextColor,
                              ),
                            ),
                            getVerSpace(8),
                            simpleText(
                              "\$1,450",
                              style: R.textStyle.boldInter().copyWith(
                                fontSize: 24,
                                color: R.colors.textColor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: FetchPixels.getPixelWidth(1),
                          height: FetchPixels.getPixelHeight(50),
                          color: R.colors.lightGreyColor,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            simpleText(
                              "Remaining",
                              style: R.textStyle.mediumInter().copyWith(
                                fontSize: 13,
                                color: R.colors.dimTextColor,
                              ),
                            ),
                            getVerSpace(8),
                            simpleText(
                              "\$550",
                              style: R.textStyle.boldInter().copyWith(
                                fontSize: 24,
                                color: R.colors.secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  getVerSpace(50),
                  simpleText(
                    "Sub Categories",
                    style: R.textStyle.semiBoldInter().copyWith(fontSize: 17),
                  ),

                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: FetchPixels.getPixelHeight(15),
                    crossAxisSpacing: FetchPixels.getPixelWidth(15),
                    childAspectRatio: 1.1,
                    children: [
                      _buildCategoryCard(
                        iconPath: R.icons.foodIcon,
                        name: "Food",
                        amount: "\$500",
                        spent: "\$420",
                        color: R.colors.foodColor,
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildCategoryCard(
                        iconPath: R.icons.transportIcon,
                        name: "Transport",
                        amount: "\$300",
                        spent: "\$250",
                        color: R.colors.transportColor,
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildCategoryCard(
                        iconPath: R.icons.billsIcon,
                        name: "Bills",
                        amount: "\$400",
                        spent: "\$380",
                        color: R.colors.billsColor,
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildCategoryCard(
                        iconPath: R.icons.shoppingIcon,
                        name: "Shopping",
                        amount: "\$350",
                        spent: "\$200",
                        color: R.colors.shoppingColor,
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildCategoryCard(
                        iconPath: R.icons.healthIcon,
                        name: "Health",
                        amount: "\$250",
                        spent: "\$120",
                        color: R.colors.healthColor,
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildCategoryCard(
                        iconPath: R.icons.entertainmentIcon,
                        name: "Entertainment",
                        amount: "\$150",
                        spent: "\$50",
                        color: R.colors.entertainmentColor,
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildCategoryCard(
                        iconPath: R.icons.othersIcon,
                        name: "Others",
                        amount: "\$50",
                        spent: "\$30",
                        color: R.colors.othersColor,
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                    ],
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
