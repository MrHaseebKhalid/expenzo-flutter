import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class ExpenseDetailsView extends StatelessWidget {
  const ExpenseDetailsView({super.key});

  Widget _buildBudgetCard({
    required String label,
    required String subtitle,
    required double progress,
    required List<BudgetDetail> details,
  }) {
    return MyContainer(
      padding: EdgeInsets.symmetric(
        horizontal: FetchPixels.getPixelWidth(20),
        vertical: FetchPixels.getPixelHeight(25),
      ),
      margin: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: FetchPixels.getPixelWidth(120),
                height: FetchPixels.getPixelHeight(120),
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 10,
                  strokeCap: StrokeCap.round,
                  backgroundColor: R.colors.lightGreyColor,
                  valueColor: AlwaysStoppedAnimation<Color>(R.colors.primaryColor),
                ),
              ),
              simpleText(
                "${(progress * 100).toInt()}%",
                style: R.textStyle.boldInter().copyWith(
                  fontSize: 18,
                  color: R.colors.textColor,
                ),
              ),
            ],
          ),
          getVerSpace(15),
          simpleText(
            label,
            style: R.textStyle.boldInter().copyWith(
              fontSize: 20,
              color: R.colors.primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          getVerSpace(20),
          ...details.map((detail) {
            return Padding(
              padding: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(12)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  simpleText(
                    detail.label,
                    style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                  ),
                  simpleText(
                    detail.value,
                    style: R.textStyle.boldInter().copyWith(
                      fontSize: 14,
                      color: detail.color,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildTransactionCard({
    required String title,
    required String subtitle,
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
                  subtitle,
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
        leading: MyBackButton(
          onTap: () => Navigator.pop(context),
        ),
        title: simpleText(
          "Expense details",
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
              "According to Food Budget",
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 16),
            ),
            getVerSpace(15),
            _buildBudgetCard(
              label: "Food\nBudget",
              subtitle: "",
              progress: 0.78,
              details: [
                BudgetDetail(
                  label: "Food Budget",
                  value: "\$230",
                  color: R.colors.secondaryColor,
                ),
                BudgetDetail(
                  label: "Food Expenses",
                  value: "\$128",
                  color: R.colors.redColor,
                ),
                BudgetDetail(
                  label: "Remaining Budget",
                  value: "\$128",
                  color: R.colors.primaryColor,
                ),
                BudgetDetail(
                  label: "Percentage",
                  value: "78%",
                  color: R.colors.primaryColor,
                ),
              ],
            ),
            getVerSpace(25),
            simpleText(
              "According to Total Budget:",
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 16),
            ),
            getVerSpace(15),
            _buildBudgetCard(
              label: "Food",
              subtitle: "",
              progress: 0.78,
              details: [
                BudgetDetail(
                  label: "Total Budget",
                  value: "\$230",
                  color: R.colors.secondaryColor,
                ),
                BudgetDetail(
                  label: "Total Expenses",
                  value: "\$128",
                  color: R.colors.redColor,
                ),
                BudgetDetail(
                  label: "Food Expenses",
                  value: "\$128",
                  color: R.colors.primaryColor,
                ),
                BudgetDetail(
                  label: "Percentage",
                  value: "78%",
                  color: R.colors.primaryColor,
                ),
              ],
            ),
            getVerSpace(25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                simpleText(
                  "Food Transactions",
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
              subtitle: "Share in Total expense: 2%",
              date: "23-04-25",
              amount: "\$12.45",
              onTap: () {},
            ),
            _buildTransactionCard(
              title: "McDonald's Pizza",
              subtitle: "Share in Total expense: 4%",
              date: "23-04-25",
              amount: "\$25.00",
              onTap: () {},
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
              subtitle: "Share in Total expense: 15%",
              date: "22-04-25",
              amount: "\$85.00",
              onTap: () {},
            ),
            _buildTransactionCard(
              title: "March Wifi bill",
              subtitle: "Share in Total expense: 10%",
              date: "22-04-25",
              amount: "\$60.00",
              onTap: () {},
            ),
            _buildTransactionCard(
              title: "Shopping at Amazon",
              subtitle: "Share in Total expense: 20%",
              date: "22-04-25",
              amount: "\$120.50",
              onTap: () {},
            ),
            getVerSpace(30),
          ],
        ),
      ),
    );
  }
}

class BudgetDetail {
  final String label;
  final String value;
  final Color color;

  BudgetDetail({
    required this.label,
    required this.value,
    required this.color,
  });
}
