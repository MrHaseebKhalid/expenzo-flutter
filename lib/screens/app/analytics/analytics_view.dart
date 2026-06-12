import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          getVerSpace(20),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                simpleText(
                  "Analytics",
                  style: R.textStyle.boldInter().copyWith(fontSize: 24),
                ),
                getVerSpace(5),
                simpleText(
                  "Control the flow of your money 💵",
                  style: R.textStyle.mediumInter().copyWith(
                    fontSize: 14,
                    color: R.colors.dimTextColor,
                  ),
                ),
              ],
            ),
          ),

          getVerSpace(25),

          // Monthly money visuals Section
          _buildMonthlyMoneyVisuals(),

          getVerSpace(25),

          // Expense visuals Section
          _buildExpenseVisuals(),

          getVerSpace(25),

          // Insights & Highlights Section
          _buildInsightsAndHighlights(),

          getVerSpace(60),
        ],
      ),
    );
  }

  Widget _buildMonthlyMoneyVisuals() {
    return Column(
      children: [
        Row(
          children: [
            simpleText(
              "Monthly money visuals",
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 14),
            ),
            getHorSpace(5),
            Icon(
              Icons.info_outline,
              size: FetchPixels.getPixelHeight(16),
              color: R.colors.dimTextColor,
            ),
          ],
        ),
        getVerSpace(10),

        MyContainer(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(20),
            vertical: FetchPixels.getPixelHeight(20),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDropdownButton("Expense vs Budget"),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: FetchPixels.getPixelWidth(12),
                            height: FetchPixels.getPixelHeight(12),
                            decoration: BoxDecoration(
                              color: R.colors.primaryColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          getHorSpace(5),
                          simpleText(
                            "Expenses",
                            style: R.textStyle.mediumInter().copyWith(
                              fontSize: 12,
                              color: R.colors.dimTextColor,
                            ),
                          ),
                        ],
                      ),
                      getHorSpace(15),
                      Row(
                        children: [
                          Container(
                            width: FetchPixels.getPixelWidth(12),
                            height: FetchPixels.getPixelHeight(12),
                            decoration: BoxDecoration(
                              color: R.colors.secondaryColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          getHorSpace(5),
                          simpleText(
                            "Budget",
                            style: R.textStyle.mediumInter().copyWith(
                              fontSize: 12,
                              color: R.colors.dimTextColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              getVerSpace(20),
              _buildGroupedBarChart(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGroupedBarChart() {
    return Column(
      children: [
        SizedBox(
          height: FetchPixels.getPixelHeight(150),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 1400,
              minY: 0,
              groupsSpace: 12,
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: 850,
                      color: R.colors.primaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    BarChartRodData(
                      toY: 900,
                      color: R.colors.secondaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: 700,
                      color: R.colors.primaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    BarChartRodData(
                      toY: 950,
                      color: R.colors.secondaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      toY: 900,
                      color: R.colors.primaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    BarChartRodData(
                      toY: 700,
                      color: R.colors.secondaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                      toY: 600,
                      color: R.colors.primaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    BarChartRodData(
                      toY: 850,
                      color: R.colors.secondaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(
                      toY: 1100,
                      color: R.colors.primaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    BarChartRodData(
                      toY: 500,
                      color: R.colors.secondaryColor,
                      width: 12,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                ),
              ],
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 200,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: R.colors.dimTextColor.withValues(alpha: 0.2),
                    strokeWidth: 1,
                  );
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const titles = ['Jan', 'Feb', 'Mar', 'Apr', 'May'];
                      if (value.toInt() >= 0 && value.toInt() < titles.length) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: simpleText(
                            titles[value.toInt()],
                            style: R.textStyle.mediumInter().copyWith(
                              fontSize: 11,
                              color: R.colors.dimTextColor,
                            ),
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 200,
                    getTitlesWidget: (value, meta) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: simpleText(
                          '\$${value.toInt()}',
                          style: R.textStyle.mediumInter().copyWith(
                            fontSize: 10,
                            color: R.colors.dimTextColor,
                          ),
                        ),
                      );
                    },
                    reservedSize: 40,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseVisuals() {
    return Column(
      children: [
        Row(
          children: [
            simpleText(
              "Expense visuals",
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 16),
            ),
            getHorSpace(8),
            Icon(
              Icons.info_outline,
              size: FetchPixels.getPixelHeight(16),
              color: R.colors.dimTextColor,
            ),
          ],
        ),
        getVerSpace(10),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDropdownButton("Monthly"),
                  Row(
                    children: [
                      Container(
                        width: FetchPixels.getPixelWidth(30),
                        height: FetchPixels.getPixelHeight(2),
                        decoration: BoxDecoration(color: R.colors.primaryColor),
                      ),
                      getHorSpace(5),
                      simpleText(
                        "Expenses",
                        style: R.textStyle.mediumInter().copyWith(
                          fontSize: 12,
                          color: R.colors.dimTextColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              getVerSpace(20),
              _buildLineChart(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLineChart() {
    return SizedBox(
      height: FetchPixels.getPixelHeight(180),
      child: Padding(
        padding: EdgeInsets.only(
          right: FetchPixels.getPixelWidth(8),
          bottom: FetchPixels.getPixelHeight(8),
        ),
        child: LineChart(
          LineChartData(
            minY: 0,
            maxY: 1400,
            gridData: FlGridData(
              show: true,
              drawVerticalLine: false,
              horizontalInterval: 200,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: R.colors.dimTextColor.withValues(alpha: 0.15),
                  strokeWidth: 1,
                );
              },
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    const titles = ['Jan', 'Feb', 'Mar', 'Apr', 'May'];
                    if (value.toInt() >= 0 && value.toInt() < titles.length) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: FetchPixels.getPixelHeight(8),
                        ),
                        child: simpleText(
                          titles[value.toInt()],
                          style: R.textStyle.mediumInter().copyWith(
                            fontSize: 11,
                            color: R.colors.dimTextColor,
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 200,
                  reservedSize: 45,
                  getTitlesWidget: (value, meta) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: FetchPixels.getPixelWidth(8),
                      ),
                      child: simpleText(
                        '\$${value.toInt()}',
                        style: R.textStyle.mediumInter().copyWith(
                          fontSize: 10,
                          color: R.colors.dimTextColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: const [
                  FlSpot(0, 420),
                  FlSpot(1, 700),
                  FlSpot(2, 560),
                  FlSpot(3, 980),
                  FlSpot(4, 840),
                ],
                isCurved: true,
                color: const Color(0xFF0F66EF),
                barWidth: 3,
                isStrokeCapRound: true,
                dotData: FlDotData(
                  show: true,
                  getDotPainter: (spot, percent, barData, index) {
                    return FlDotCirclePainter(
                      radius: 4,
                      color: const Color(0xFF0F66EF),
                      strokeWidth: 0,
                    );
                  },
                ),
                belowBarData: BarAreaData(show: false),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInsightsAndHighlights() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              simpleText(
                "Insights & Highlights",
                style: R.textStyle.boldInter().copyWith(fontSize: 18),
              ),
              getVerSpace(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildDropdownButton("Monthly"),
                  getHorSpace(10),
                  _buildDropdownButton("Current Month (May)"),
                ],
              ),
            ],
          ),
        ),

        getVerSpace(8),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(20),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: simpleText(
              "Duration: Till Today — 28th May, 2025",
              style: R.textStyle.mediumInter().copyWith(
                fontSize: 12,
                color: R.colors.dimTextColor,
              ),
            ),
          ),
        ),
        getVerSpace(20),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(10),
          ),
          child: GridView.count(
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
                R.colors.redColor,
              ),
              _buildInsightCard(
                "Average Daily Spending",
                "\$230",
                R.colors.redColor,
              ),
              _buildInsightCard(
                "Highest Spending Category",
                "Foods",
                R.colors.primaryColor,
              ),
              _buildInsightCardWithIcon(
                "Spending Trend",
                "32% (Up)",
                R.colors.redColor,
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
        ),
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
          getHorSpace(8),
          SvgPicture.asset(
            R.icons.downArrowIcon,
            width: FetchPixels.getPixelWidth(8),
            height: FetchPixels.getPixelHeight(8),
            colorFilter: ColorFilter.mode(
              R.colors.dimTextColor,
              BlendMode.srcIn,
            ),
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
}
