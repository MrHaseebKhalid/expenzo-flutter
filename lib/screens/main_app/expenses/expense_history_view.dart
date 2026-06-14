import "package:expenzo/base/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class ExpenseHistoryView extends StatelessWidget {
  const ExpenseHistoryView({super.key});

  Widget _buildExpenseCard({
    required String label,
    required double progress,
    required Color color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(15),
          vertical: FetchPixels.getPixelHeight(20),
        ),
        margin: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: FetchPixels.getPixelWidth(80),
                  height: FetchPixels.getPixelHeight(80),
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 8,
                    strokeCap: StrokeCap.round,
                    backgroundColor: R.colors.lightGreyColor,
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
                simpleText(
                  "${(progress * 100).toInt()}%",
                  style: R.textStyle.boldInter().copyWith(
                    fontSize: 14,
                    color: R.colors.textColor,
                  ),
                ),
              ],
            ),
            getVerSpace(12),
            simpleText(
              label,
              style: R.textStyle.semiBoldInter().copyWith(
                fontSize: 13,
                color: color,
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
            child: MyAppBar1(titleText: "Expenses", titleFontSize: 19),
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
                    "All your Expenses Categories are here",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 14,
                      color: R.colors.dimTextColor,
                    ),
                  ),
                  getVerSpace(25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      simpleText(
                        "According to the sub category\nbudget",
                        style: R.textStyle.boldInter().copyWith(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.filter_list,
                            size: FetchPixels.getPixelHeight(20),
                            color: R.colors.primaryColor,
                          ),
                          getHorSpace(5),
                          simpleText(
                            "Filters",
                            style: R.textStyle.semiBoldInter().copyWith(
                              fontSize: 14,
                              color: R.colors.primaryColor,
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
                  getVerSpace(25),
                  GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: FetchPixels.getPixelHeight(15),
                    crossAxisSpacing: FetchPixels.getPixelWidth(15),
                    childAspectRatio: 0.9,
                    children: [
                      _buildExpenseCard(
                        label: "Food",
                        progress: 0.78,
                        color: R.colors.primaryColor,
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildExpenseCard(
                        label: "Transport",
                        progress: 0.41,
                        color: const Color(0xFFFF9800),
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildExpenseCard(
                        label: "Bills",
                        progress: 0.79,
                        color: const Color(0xFF9C27B0),
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildExpenseCard(
                        label: "Shopping",
                        progress: 0.67,
                        color: const Color(0xFFE91E63),
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildExpenseCard(
                        label: "Health",
                        progress: 0.31,
                        color: const Color(0xFF00BCD4),
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildExpenseCard(
                        label: "Entertainment",
                        progress: 0.63,
                        color: const Color(0xFFE040FB),
                        onTap: () {
                          Constant.navigateToRoute(
                            context,
                            Routes.expenseDetails,
                          );
                        },
                      ),
                      _buildExpenseCard(
                        label: "Others",
                        progress: 0.38,
                        color: const Color(0xFF009688),
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
