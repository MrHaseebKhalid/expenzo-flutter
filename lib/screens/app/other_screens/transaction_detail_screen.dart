import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({super.key});

  Widget _buildDetailRow({
    required String label,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: FetchPixels.getPixelHeight(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          simpleText(
            label,
            style: R.textStyle.mediumInter().copyWith(
              fontSize: 14,
              color: R.colors.dimTextColor,
            ),
          ),
          simpleText(
            value,
            style: R.textStyle.semiBoldInter().copyWith(fontSize: 14),
          ),
        ],
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
          "Transaction Details",
          style: R.textStyle.boldInter().copyWith(
            fontSize: 20,
            color: R.colors.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: R.colors.bgColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.edit,
              color: R.colors.primaryColor,
              size: FetchPixels.getPixelHeight(24),
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.delete,
              color: R.colors.redColor,
              size: FetchPixels.getPixelHeight(24),
            ),
            onPressed: () {},
          ),
        ],
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
            MyContainer(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(20),
                vertical: FetchPixels.getPixelHeight(25),
              ),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: FetchPixels.getPixelWidth(70),
                    height: FetchPixels.getPixelHeight(70),
                    decoration: BoxDecoration(
                      color: R.colors.billsColor.withValues(alpha: 0.15),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: simpleText(
                        "B",
                        style: R.textStyle.boldInter().copyWith(
                          fontSize: 28,
                          color: R.colors.billsColor,
                        ),
                      ),
                    ),
                  ),
                  getVerSpace(15),
                  simpleText(
                    "March Electricity bill",
                    style: R.textStyle.boldInter().copyWith(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  getVerSpace(5),
                  simpleText(
                    "Bills",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 14,
                      color: R.colors.dimTextColor,
                    ),
                  ),
                  getVerSpace(20),
                  simpleText(
                    "\$12.45",
                    style: R.textStyle.boldInter().copyWith(
                      fontSize: 32,
                      color: R.colors.redColor,
                    ),
                  ),
                ],
              ),
            ),
            getVerSpace(25),
            simpleText(
              "Transaction Information",
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 16),
            ),
            getVerSpace(20),
            MyContainer(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(20),
                vertical: FetchPixels.getPixelHeight(20),
              ),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(
                    label: "Date",
                    value: "23-04-25",
                  ),
                  _buildDetailRow(
                    label: "Time",
                    value: "2:30 PM",
                  ),
                  _buildDetailRow(
                    label: "Payment Method",
                    value: "Credit Card",
                  ),
                  _buildDetailRow(
                    label: "Status",
                    value: "Completed",
                  ),
                  Divider(
                    color: R.colors.lightGreyColor,
                    thickness: 1,
                  ),
                  getVerSpace(15),
                  simpleText(
                    "Description",
                    style: R.textStyle.semiBoldInter().copyWith(fontSize: 14),
                  ),
                  getVerSpace(10),
                  simpleText(
                    "Monthly electricity bill for March 2025. Payment includes standard residential rates and taxes.",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 14,
                      color: R.colors.dimTextColor,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            getVerSpace(25),
            simpleText(
              "Actions",
              style: R.textStyle.semiBoldInter().copyWith(fontSize: 16),
            ),
            getVerSpace(15),
            Row(
              children: [
                Expanded(
                  child: MyContainer(
                    padding: EdgeInsets.symmetric(
                      vertical: FetchPixels.getPixelHeight(15),
                    ),
                    margin: EdgeInsets.only(right: FetchPixels.getPixelWidth(10)),
                    child: Column(
                      children: [
                        Icon(
                          Icons.receipt_long,
                          color: R.colors.primaryColor,
                          size: FetchPixels.getPixelHeight(24),
                        ),
                        getVerSpace(5),
                        simpleText(
                          "Receipt",
                          style: R.textStyle.mediumInter().copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    padding: EdgeInsets.symmetric(
                      vertical: FetchPixels.getPixelHeight(15),
                    ),
                    margin: EdgeInsets.only(right: FetchPixels.getPixelWidth(10)),
                    child: Column(
                      children: [
                        Icon(
                          Icons.share,
                          color: R.colors.primaryColor,
                          size: FetchPixels.getPixelHeight(24),
                        ),
                        getVerSpace(5),
                        simpleText(
                          "Share",
                          style: R.textStyle.mediumInter().copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    padding: EdgeInsets.symmetric(
                      vertical: FetchPixels.getPixelHeight(15),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.report,
                          color: R.colors.redColor,
                          size: FetchPixels.getPixelHeight(24),
                        ),
                        getVerSpace(5),
                        simpleText(
                          "Report",
                          style: R.textStyle.mediumInter().copyWith(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            getVerSpace(30),
          ],
        ),
      ),
    );
  }
}
