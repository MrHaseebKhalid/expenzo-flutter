import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class TransactionHistoryView extends StatelessWidget {
  const TransactionHistoryView({super.key});

  Widget _buildTransactionCard({
    required String title,
    required String category,
    required String date,
    required String amount,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                simpleText(
                  title,
                  style: R.textStyle.boldInter().copyWith(fontSize: 14),
                ),
                simpleText(
                  date,
                  style: R.textStyle.mediumInter().copyWith(
                    fontSize: 12,
                    color: R.colors.dimTextColor,
                  ),
                ),
              ],
            ),
            getVerSpace(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                simpleText(
                  "Category : $category",
                  style: R.textStyle.mediumInter().copyWith(
                    fontSize: 12,
                    color: R.colors.dimTextColor,
                  ),
                ),
                Row(
                  children: [
                    simpleText(
                      amount,
                      style: R.textStyle.boldInter().copyWith(
                        fontSize: 14,
                        color: R.colors.redColor,
                      ),
                    ),
                    getHorSpace(5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: FetchPixels.getPixelHeight(14),
                      color: R.colors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(onTap: () => Navigator.pop(context)),
        title: simpleText(
          "Transactions",
          style: R.textStyle.boldInter().copyWith(
            fontSize: 20,
            color: R.colors.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: R.colors.bgColor,
      ),
      backgroundColor: R.colors.bgColor,
      body: SingleChildScrollView(
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
                  style: R.textStyle.boldInter().copyWith(fontSize: 18),
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
                    getHorSpace(3),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: FetchPixels.getPixelHeight(18),
                      color: R.colors.primaryColor,
                    ),
                  ],
                ),
              ],
            ),
            getVerSpace(20),
            simpleText(
              "Recents",
              style: R.textStyle.mediumInter().copyWith(
                fontSize: 14,
                color: R.colors.dimTextColor,
              ),
            ),
            getVerSpace(15),
            _buildTransactionCard(
              title: "March Electricity bill",
              category: "Bill",
              date: "23-04-25",
              amount: "\$12.45",
              onTap: () {
                Constant.navigateToRoute(context, '/transaction-details');
              },
            ),
            _buildTransactionCard(
              title: "McDonald's Pizza",
              category: "Food",
              date: "23-04-25",
              amount: "\$25.00",
              onTap: () {
                Constant.navigateToRoute(context, '/transaction-details');
              },
            ),
            getVerSpace(20),
            simpleText(
              "Yesterday",
              style: R.textStyle.mediumInter().copyWith(
                fontSize: 14,
                color: R.colors.dimTextColor,
              ),
            ),
            getVerSpace(15),
            _buildTransactionCard(
              title: "Travel to San Francisco",
              category: "Transport",
              date: "22-04-25",
              amount: "\$85.00",
              onTap: () {
                Constant.navigateToRoute(context, '/transaction-details');
              },
            ),
            _buildTransactionCard(
              title: "March Wifi bill",
              category: "Bill",
              date: "22-04-25",
              amount: "\$60.00",
              onTap: () {
                Constant.navigateToRoute(context, '/transaction-details');
              },
            ),
            _buildTransactionCard(
              title: "Shopping at Amazon",
              category: "Shopping",
              date: "22-04-25",
              amount: "\$120.50",
              onTap: () {
                Constant.navigateToRoute(context, '/transaction-details');
              },
            ),
            getVerSpace(30),
          ],
        ),
      ),
    );
  }
}
