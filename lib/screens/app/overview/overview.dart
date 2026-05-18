import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/data/expense_data.dart";
import "package:expenzo/screens/app/widgets/donut_chart_config.dart";
import "package:expenzo/screens/app/widgets/expense_donut_chart.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

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
            simpleText("This month"),
            Icon(Icons.keyboard_arrow_down_rounded),
            simpleText("  Till today — 28/01/25"),
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
            Icon(
              Icons.info_outline_rounded,
              color: R.colors.darkGreyColor,
              size: FetchPixels.getPixelHeight(17),
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
        getVerSpace(10),
        ExpenseDonutChart(
          segments: expenseDataRepository.overviewDonutSegments,
          config: const DonutChartConfig(),
        ),
      ],
    );
  }
}
