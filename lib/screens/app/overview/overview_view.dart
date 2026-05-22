import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/data/expense_data.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/screens/app/overview/widgets/donut_chart_pill.dart";
import "package:expenzo/screens/app/widgets/donut_chart_config.dart";
import "package:expenzo/screens/app/widgets/expense_donut_chart.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        getVerSpace(10),
        Row(
          children: [
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
        getVerSpace(5),
        MyContainer(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(10),
            vertical: FetchPixels.getPixelHeight(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                spacing: FetchPixels.getPixelWidth(25),
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      simpleText(
                        "Total Budget",
                        style: R.textStyle.boldInter().copyWith(fontSize: 14),
                      ),
                      getVerSpace(10),
                      simpleText(
                        "\$2000",
                        style: R.textStyle.boldInter().copyWith(
                          fontSize: 22,
                          color: R.colors.secondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: FetchPixels.getPixelHeight(40),
                    width: FetchPixels.getPixelWidth(1),
                    color: R.colors.darkGreyColor,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      simpleText(
                        "Total Expenses",
                        style: R.textStyle.boldInter().copyWith(fontSize: 14),
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
                ],
              ),
              getVerSpace(20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  simpleText(
                    "Net Amount",
                    style: R.textStyle.boldInter().copyWith(fontSize: 12),
                  ),
                  getHorSpace(10),
                  simpleText(
                    "+\$550",
                    style: R.textStyle.boldInter().copyWith(
                      fontSize: 17,
                      color: R.colors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        getVerSpace(7),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            simpleText(
              "Spending Rate",
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 11),
            ),
            getHorSpace(5),
            SvgPicture.asset(
              R.icons.infoIcon,
              colorFilter: ColorFilter.mode(
                R.colors.darkGreyColor,
                BlendMode.srcIn,
              ),
              height: FetchPixels.getPixelHeight(16),
            ),
            getHorSpace(10),

            Container(
              alignment: Alignment.center,
              height: FetchPixels.getPixelHeight(9),
              width: FetchPixels.getPixelWidth(9),
              decoration: BoxDecoration(
                color: R.colors.secondaryColor,
                shape: BoxShape.circle,
              ),
            ),
            getHorSpace(10),
            simpleText(
              "Excellent (23%)",
              style: R.textStyle.semiBoldInter().copyWith(
                fontSize: 13,
                color: R.colors.secondaryColor,
              ),
            ),
          ],
        ),
        getVerSpace(25),
        ExpenseDonutChart(
          segments: expenseDataRepository.overviewDonutSegments,
          config: const DonutChartConfig(),
        ),

        getVerSpace(20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: FetchPixels.getPixelHeight(15),
              children: [
                DonutChartPill(text: "Food", color: R.colors.foodColor),
                DonutChartPill(text: "Shopping", color: R.colors.shoppingColor),
              ],
            ),
            getHorSpace(68),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: FetchPixels.getPixelHeight(15),
              children: [
                DonutChartPill(
                  text: "Transport",
                  color: R.colors.transportColor,
                ),
                DonutChartPill(text: "Health", color: R.colors.healthColor),
                DonutChartPill(text: "Others", color: R.colors.othersColor),
              ],
            ),
            getHorSpace(40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: FetchPixels.getPixelHeight(15),
              children: [
                DonutChartPill(text: "Bills", color: R.colors.billsColor),

                DonutChartPill(
                  text: "Entertainment",
                  color: R.colors.entertainmentColor,
                ),
              ],
            ),
          ],
        ),
        getVerSpace(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            simpleText(
              "Expense Pie Graph",
              style: R.textStyle.boldInter().copyWith(
                fontSize: 12,
                color: R.colors.primaryColor,
              ),
            ),
            getHorSpace(5),
            SvgPicture.asset(
              R.icons.infoIcon,
              colorFilter: ColorFilter.mode(
                R.colors.primaryColor,
                BlendMode.srcIn,
              ),
              height: FetchPixels.getPixelHeight(16),
            ),
          ],
        ),
      ],
    );
  }
}
