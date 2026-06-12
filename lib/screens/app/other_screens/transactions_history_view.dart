import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/utils/routes.dart";
import "package:expenzo/widgets/my_app_bar1.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});

  Widget _buildTransactionCard({
    required String title,
    required String category,
    required String date,
    required String amount,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
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
                color: color.withValues(alpha: 0.15),
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
                    "Category: $category",
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
            child: MyAppBar1(titleText: "Transactions", titleFontSize: 19),
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
                    "All your transactions are here",
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
                        "Your Transactions",
                        style: R.textStyle.semiBoldInter().copyWith(
                          fontSize: 18,
                        ),
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
                  getVerSpace(20),
                  simpleText(
                    "Recents",
                    style: R.textStyle.semiBoldInter().copyWith(
                      fontSize: 14,
                      color: R.colors.dimTextColor,
                    ),
                  ),
                  getVerSpace(15),
                  _buildTransactionCard(
                    title: "March Electricity bill",
                    category: "Bills",
                    date: "23/04/25",
                    amount: "\$12.45",
                    color: R.colors.billsColor,
                    onTap: () {
                      Constant.navigateToRoute(
                        context,
                        Routes.transactionDetails,
                      );
                    },
                  ),
                  _buildTransactionCard(
                    title: "McDonald's Pizza",
                    category: "Food",
                    date: "23/04/25",
                    amount: "\$25.00",
                    color: R.colors.foodColor,
                    onTap: () {},
                  ),
                  getVerSpace(20),
                  simpleText(
                    "Yesterday",
                    style: R.textStyle.semiBoldInter().copyWith(
                      fontSize: 14,
                      color: R.colors.dimTextColor,
                    ),
                  ),
                  getVerSpace(15),
                  _buildTransactionCard(
                    title: "Travel to San Francisco",
                    category: "Transport",
                    date: "22/04/25",
                    amount: "\$85.00",
                    color: R.colors.transportColor,
                    onTap: () {},
                  ),
                  _buildTransactionCard(
                    title: "March Wifi bill",
                    category: "Bills",
                    date: "22/04/25",
                    amount: "\$60.00",
                    color: R.colors.billsColor,
                    onTap: () {},
                  ),
                  _buildTransactionCard(
                    title: "Shopping at Amazon",
                    category: "Shopping",
                    date: "22/04/25",
                    amount: "\$120.50",
                    color: R.colors.shoppingColor,
                    onTap: () {},
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
