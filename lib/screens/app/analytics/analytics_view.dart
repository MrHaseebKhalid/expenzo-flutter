import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  Widget _buildCategoryItem(
    String label,
    String amount,
    double progress,
    Color color,
  ) {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(15),
        vertical: FetchPixels.getPixelHeight(15),
      ),
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: FetchPixels.getPixelWidth(12),
                    height: FetchPixels.getPixelHeight(12),
                    decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  getHorSpace(10),
                  simpleText(
                    label,
                    style: R.textStyle.semiBoldInter().copyWith(fontSize: 14),
                  ),
                ],
              ),
              simpleText(
                amount,
                style: R.textStyle.semiBoldInter().copyWith(
                  fontSize: 14,
                  color: R.colors.textColor,
                ),
              ),
            ],
          ),
          getVerSpace(10),
          Container(
            height: FetchPixels.getPixelHeight(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(4)),
              color: R.colors.lightGreyColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(4)),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: FetchPixels.getPixelHeight(8),
                backgroundColor: R.colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getVerSpace(10),
        Row(
          children: [
            getHorSpace(10),
            simpleText(
              "This month",
              style: R.textStyle.mediumInter().copyWith(fontSize: 15),
            ),
            Icon(Icons.keyboard_arrow_down_rounded),
            simpleText(
              "  Till today — 28/01/25",
              style: R.textStyle.mediumInter().copyWith(fontSize: 15),
            ),
          ],
        ),
        getVerSpace(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: FetchPixels.getPixelWidth(30),
          children: [
            MyContainer(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(15),
                vertical: FetchPixels.getPixelHeight(20),
              ),
              containerWidth: FetchPixels.getPixelWidth(150),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  simpleText(
                    "Total Income",
                    style: R.textStyle.boldInter().copyWith(fontSize: 15),
                  ),
                  getVerSpace(10),
                  simpleText(
                    "\$3250",
                    style: R.textStyle.boldInter().copyWith(
                      fontSize: 22,
                      color: R.colors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            MyContainer(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(15),
                vertical: FetchPixels.getPixelHeight(20),
              ),
              margin: EdgeInsets.zero,
              containerWidth: FetchPixels.getPixelWidth(150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  simpleText(
                    "Total Expenses",
                    style: R.textStyle.boldInter().copyWith(fontSize: 15),
                  ),
                  getVerSpace(10),
                  simpleText(
                    "\$1450",
                    style: R.textStyle.boldInter().copyWith(
                      fontSize: 22,
                      color: R.colors.redColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        getVerSpace(25),
        MyContainer(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(20),
            vertical: FetchPixels.getPixelHeight(20),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              simpleText(
                "Monthly Comparison",
                style: R.textStyle.semiBoldInter().copyWith(fontSize: 16),
              ),
              getVerSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildBarChartItem("Jan", 0.6, R.colors.secondaryColor),
                  _buildBarChartItem("Feb", 0.8, R.colors.secondaryColor),
                  _buildBarChartItem("Mar", 0.5, R.colors.secondaryColor),
                  _buildBarChartItem("Apr", 0.9, R.colors.primaryColor),
                ],
              ),
            ],
          ),
        ),
        getVerSpace(25),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simpleText(
              "Monthly Spending",
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 18),
            ),
            getVerSpace(15),
            _buildCategoryItem("Food", "\$450", 0.78, R.colors.foodColor),
            _buildCategoryItem(
              "Transport",
              "\$280",
              0.55,
              R.colors.transportColor,
            ),
            _buildCategoryItem("Bills", "\$320", 0.65, R.colors.billsColor),
            _buildCategoryItem(
              "Shopping",
              "\$200",
              0.40,
              R.colors.shoppingColor,
            ),
            _buildCategoryItem(
              "Entertainment",
              "\$150",
              0.30,
              R.colors.entertainmentColor,
            ),
          ],
        ),
        getVerSpace(30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            simpleText(
              "Insights & Highlights",
              style: R.textStyle.boldInter().copyWith(fontSize: 18),
            ),
            getVerSpace(15),
            Row(
              children: [
                _buildDropdownButton("Monthly"),
                getHorSpace(10),
                _buildDropdownButton("Current Month (May)"),
              ],
            ),
            getVerSpace(8),
            Align(
              alignment: Alignment.centerRight,
              child: simpleText(
                "Duration : Till Today — 28th May 2025",
                style: R.textStyle.mediumInter().copyWith(
                  fontSize: 12,
                  color: R.colors.dimTextColor,
                ),
              ),
            ),
            getVerSpace(20),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: FetchPixels.getPixelHeight(12),
              crossAxisSpacing: FetchPixels.getPixelWidth(12),
              childAspectRatio: 1.3,
              children: [
                _buildInsightCard(
                  "Highest Expense Day",
                  "12th May, 2025",
                  R.colors.redColor,
                ),
                _buildInsightCard(
                  "Lowest Expense Day",
                  "18th May, 2025",
                  R.colors.secondaryColor,
                ),
                _buildInsightCard(
                  "Total Monthly Spending",
                  "\$12353",
                  const Color(0xFFFF9800),
                ),
                _buildInsightCard(
                  "Average Daily Spending",
                  "\$230",
                  const Color(0xFFFF9800),
                ),
                _buildInsightCard(
                  "Highest Spending Category",
                  "Foods",
                  R.colors.primaryColor,
                ),
                _buildInsightCardWithIcon(
                  "Spending Trend",
                  "32% (Up)",
                  const Color(0xFFFF9800),
                  Icons.arrow_upward,
                ),
                _buildInsightCard(
                  "Savings Ratio",
                  "42%",
                  R.colors.secondaryColor,
                ),
                _buildInsightCard("Budget Used", "78%", R.colors.primaryColor),
                _buildInsightCard(
                  "Total Transactions",
                  "17",
                  R.colors.primaryColor,
                ),
                _buildInsightCard(
                  "Progress Status",
                  "Positive",
                  R.colors.secondaryColor,
                ),
              ],
            ),
          ],
        ),
        getVerSpace(30),
      ],
    );
  }

  Widget _buildDropdownButton(String value) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(15),
        vertical: FetchPixels.getPixelHeight(12),
      ),
      decoration: BoxDecoration(
        color: R.colors.lightGreyColor,
        borderRadius: BorderRadius.circular(FetchPixels.getPixelWidth(12)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          simpleText(
            value,
            style: R.textStyle.mediumInter().copyWith(fontSize: 14),
          ),
          getHorSpace(5),
          Icon(
            Icons.keyboard_arrow_down,
            size: FetchPixels.getPixelHeight(18),
            color: R.colors.dimTextColor,
          ),
        ],
      ),
    );
  }

  Widget _buildInsightCard(String label, String value, Color valueColor) {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(12),
        vertical: FetchPixels.getPixelHeight(15),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          simpleText(
            label,
            style: R.textStyle.mediumInter().copyWith(
              fontSize: 11,
              color: R.colors.textColor,
            ),
            textAlign: TextAlign.center,
          ),
          getVerSpace(8),
          simpleText(
            value,
            style: R.textStyle.boldInter().copyWith(
              fontSize: 15,
              color: valueColor,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildInsightCardWithIcon(
    String label,
    String value,
    Color valueColor,
    IconData icon,
  ) {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(12),
        vertical: FetchPixels.getPixelHeight(15),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          simpleText(
            label,
            style: R.textStyle.mediumInter().copyWith(
              fontSize: 11,
              color: R.colors.textColor,
            ),
            textAlign: TextAlign.center,
          ),
          getVerSpace(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              simpleText(
                value,
                style: R.textStyle.boldInter().copyWith(
                  fontSize: 15,
                  color: valueColor,
                ),
              ),
              getHorSpace(3),
              Icon(
                icon,
                size: FetchPixels.getPixelHeight(14),
                color: valueColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBarChartItem(String label, double height, Color color) {
    return Column(
      children: [
        Container(
          width: FetchPixels.getPixelWidth(40),
          height: FetchPixels.getPixelHeight(height * 100),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(FetchPixels.getPixelWidth(8)),
            ),
          ),
        ),
        getVerSpace(8),
        simpleText(
          label,
          style: R.textStyle.mediumInter().copyWith(
            fontSize: 12,
            color: R.colors.dimTextColor,
          ),
        ),
      ],
    );
  }
}
