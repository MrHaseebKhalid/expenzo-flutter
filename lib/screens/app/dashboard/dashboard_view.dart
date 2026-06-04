import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/data/expense_data.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  Widget _buildTransactionItem(
    String title,
    String category,
    String amount,
    String date,
    Color color,
  ) {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(15),
        vertical: FetchPixels.getPixelHeight(15),
      ),
      margin: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
      child: Row(
        children: [
          Container(
            width: FetchPixels.getPixelWidth(45),
            height: FetchPixels.getPixelHeight(45),
            decoration: BoxDecoration(
              color: color.withValues(alpha: Constant.getOpacityValues(15)),
              borderRadius: BorderRadius.circular(
                FetchPixels.getPixelWidth(12),
              ),
            ),
            child: Center(
              child: simpleText(
                category[0],
                style: R.textStyle.boldInter().copyWith(
                  fontSize: 18,
                  color: color,
                ),
              ),
            ),
          ),
          getHorSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                simpleText(
                  title,
                  style: R.textStyle.semiBoldInter().copyWith(fontSize: 14),
                ),
                getVerSpace(4),
                simpleText(
                  category,
                  style: R.textStyle.mediumInter().copyWith(
                    fontSize: 12,
                    color: R.colors.dimTextColor,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              simpleText(
                amount,
                style: R.textStyle.semiBoldInter().copyWith(
                  fontSize: 14,
                  color: R.colors.redColor,
                ),
              ),
              getVerSpace(4),
              simpleText(
                date,
                style: R.textStyle.mediumInter().copyWith(
                  fontSize: 11,
                  color: R.colors.dimTextColor,
                ),
              ),
            ],
          ),
          getHorSpace(8),
          Icon(
            Icons.arrow_forward_ios,
            size: FetchPixels.getPixelHeight(14),
            color: R.colors.dimTextColor,
          ),
        ],
      ),
    );
  }

  void _navigateToExpensesScreen(BuildContext context) {
    Constant.navigateToRoute(context, '/expense-history');
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
                    "Total Budget",
                    style: R.textStyle.boldInter().copyWith(fontSize: 15),
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
        getVerSpace(20),
        MyContainer(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(15),
            vertical: FetchPixels.getPixelHeight(17),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              simpleText(
                "Budget Bar",
                style: R.textStyle.mediumInter().copyWith(fontSize: 15),
              ),
              getVerSpace(7),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: FetchPixels.getPixelWidth(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          FetchPixels.getPixelWidth(16),
                        ),
                        border: BoxBorder.all(
                          width: 2.0,
                          color: R.colors.primaryColor,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(
                          FetchPixels.getPixelWidth(16),
                        ),
                        child: LinearProgressIndicator(
                          value: 0.353,
                          minHeight: FetchPixels.getPixelHeight(9),
                          backgroundColor: R.colors.transparent,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            R.colors.redColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  getHorSpace(10),
                  simpleText(
                    "65.3%",
                    style: R.textStyle.mediumInter().copyWith(fontSize: 12.5),
                  ),
                ],
              ),
              getVerSpace(7),

              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: FetchPixels.getPixelHeight(9),
                    width: FetchPixels.getPixelWidth(9),
                    decoration: BoxDecoration(
                      color: R.colors.primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  getHorSpace(7),
                  simpleText(
                    "Total Budget",
                    style: R.textStyle.mediumInter().copyWith(fontSize: 11.2),
                  ),
                  getHorSpace(20),

                  Container(
                    alignment: Alignment.center,
                    height: FetchPixels.getPixelHeight(9),
                    width: FetchPixels.getPixelWidth(9),
                    decoration: BoxDecoration(
                      color: R.colors.redColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  getHorSpace(7),
                  simpleText(
                    "Expenses",
                    style: R.textStyle.mediumInter().copyWith(fontSize: 11.2),
                  ),
                ],
              ),
            ],
          ),
        ),
        getVerSpace(30),

        // Expenses Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                simpleText(
                  "Expenses",
                  style: R.textStyle.semiBoldInter().copyWith(fontSize: 18),
                ),
                GestureDetector(
                  onTap: () => _navigateToExpensesScreen(context),
                  child: simpleText(
                    "see more",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 14,
                      color: R.colors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            getVerSpace(15),
            SizedBox(
              height: FetchPixels.getPixelHeight(160),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount:
                    StaticExpenseDataRepository
                        .instance
                        .overviewDonutSegments
                        .length +
                    1,
                itemBuilder: (context, index) {
                  if (index ==
                      StaticExpenseDataRepository
                          .instance
                          .overviewDonutSegments
                          .length) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: FetchPixels.getPixelWidth(15),
                      ),
                      child: GestureDetector(
                        onTap: () => _navigateToExpensesScreen(context),
                        child: MyContainer(
                          padding: EdgeInsets.symmetric(
                            horizontal: FetchPixels.getPixelWidth(15),
                            vertical: FetchPixels.getPixelHeight(15),
                          ),
                          margin: EdgeInsets.zero,
                          containerWidth: FetchPixels.getPixelWidth(110),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: FetchPixels.getPixelWidth(50),
                                height: FetchPixels.getPixelHeight(50),
                                decoration: BoxDecoration(
                                  color: R.colors.primaryColor.withValues(
                                    alpha: Constant.getOpacityValues(10),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: FetchPixels.getPixelHeight(20),
                                  color: R.colors.primaryColor,
                                ),
                              ),
                              getVerSpace(10),
                              simpleText(
                                "See more",
                                style: R.textStyle.mediumInter().copyWith(
                                  fontSize: 13,
                                  color: R.colors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }

                  final segment = StaticExpenseDataRepository
                      .instance
                      .overviewDonutSegments[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      right: FetchPixels.getPixelWidth(15),
                    ),
                    child: MyContainer(
                      padding: EdgeInsets.symmetric(
                        horizontal: FetchPixels.getPixelWidth(15),
                        vertical: FetchPixels.getPixelHeight(15),
                      ),
                      margin: EdgeInsets.zero,
                      containerWidth: FetchPixels.getPixelWidth(110),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                width: FetchPixels.getPixelWidth(80),
                                height: FetchPixels.getPixelHeight(80),
                                child: CircularProgressIndicator(
                                  value: 0.78,
                                  strokeWidth: 8,
                                  strokeCap: StrokeCap.round,
                                  backgroundColor: R.colors.lightGreyColor,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    segment.color,
                                  ),
                                ),
                              ),
                              simpleText(
                                "78%",
                                style: R.textStyle.boldInter().copyWith(
                                  fontSize: 14,
                                  color: R.colors.textColor,
                                ),
                              ),
                            ],
                          ),
                          getVerSpace(10),
                          simpleText(
                            segment.label,
                            style: R.textStyle.mediumInter().copyWith(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        getVerSpace(30),

        // Transactions Section
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                simpleText(
                  "Transactions",
                  style: R.textStyle.semiBoldInter().copyWith(fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {},
                  child: simpleText(
                    "see more",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 14,
                      color: R.colors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            getVerSpace(8),
            simpleText(
              "Recents",
              style: R.textStyle.mediumInter().copyWith(
                fontSize: 14,
                color: R.colors.dimTextColor,
              ),
            ),
            getVerSpace(15),
            _buildTransactionItem(
              "March Electricity bill",
              "Bills",
              "\$120",
              "28/04/25",
              R.colors.billsColor,
            ),
            _buildTransactionItem(
              "McDonald's Pizza",
              "Food",
              "\$25",
              "27/04/25",
              R.colors.foodColor,
            ),
            _buildTransactionItem(
              "Travel to San Francisco",
              "Transport",
              "\$85",
              "26/04/25",
              R.colors.transportColor,
            ),
            _buildTransactionItem(
              "March Wifi bill",
              "Bills",
              "\$60",
              "25/04/25",
              R.colors.billsColor,
            ),
            getVerSpace(30),
          ],
        ),
      ],
    );
  }
}
