import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

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
            Icon(
              Icons.arrow_forward_ios,
              size: FetchPixels.getPixelHeight(14),
              color: R.colors.dimTextColor,
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
        leading: MyBackButton(
          onTap: () => Navigator.pop(context),
        ),
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
                  style: R.textStyle.semiBoldInter().copyWith(fontSize: 18),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.filter_list,
                      size: FetchPixels.getPixelHeight(20),
                      color: R.colors.primaryColor,
                    ),
                    getHorSpace(5),
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: FetchPixels.getPixelHeight(20),
                      color: R.colors.primaryColor,
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
              date: "23-04-25",
              amount: "\$12.45",
              color: R.colors.billsColor,
              onTap: () {},
            ),
            _buildTransactionCard(
              title: "McDonald's Pizza",
              category: "Food",
              date: "23-04-25",
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
              date: "22-04-25",
              amount: "\$85.00",
              color: R.colors.transportColor,
              onTap: () {},
            ),
            _buildTransactionCard(
              title: "March Wifi bill",
              category: "Bills",
              date: "22-04-25",
              amount: "\$60.00",
              color: R.colors.billsColor,
              onTap: () {},
            ),
            _buildTransactionCard(
              title: "Shopping at Amazon",
              category: "Shopping",
              date: "22-04-25",
              amount: "\$120.50",
              color: R.colors.shoppingColor,
              onTap: () {},
            ),
            getVerSpace(30),
          ],
        ),
      ),
    );
  }
}
