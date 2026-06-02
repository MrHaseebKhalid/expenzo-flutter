import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class TransactionDetailsView extends StatelessWidget {
  const TransactionDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyBackButton(
          onTap: () => Navigator.pop(context),
        ),
        title: simpleText(
          "Transaction details",
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
            MyContainer(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(20),
                vertical: FetchPixels.getPixelHeight(25),
              ),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      simpleText(
                        "Name : Electricity Bills",
                        style: R.textStyle.boldInter().copyWith(
                          fontSize: 16,
                          color: R.colors.primaryColor,
                        ),
                      ),
                      Icon(
                        Icons.edit,
                        color: R.colors.primaryColor,
                        size: FetchPixels.getPixelHeight(20),
                      ),
                    ],
                  ),
                  getVerSpace(20),
                  simpleText(
                    "Payment method : Cash",
                    style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                  ),
                  getVerSpace(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      simpleText(
                        "Date : 24/04/2025",
                        style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                      ),
                      simpleText(
                        "Price: \$34",
                        style: R.textStyle.boldInter().copyWith(
                          fontSize: 16,
                          color: R.colors.redColor,
                        ),
                      ),
                    ],
                  ),
                  getVerSpace(12),
                  simpleText(
                    "Category : Bills",
                    style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                  ),
                  getVerSpace(20),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: FetchPixels.getPixelWidth(15),
                      vertical: FetchPixels.getPixelHeight(15),
                    ),
                    decoration: BoxDecoration(
                      color: R.colors.lightGreyColor,
                      borderRadius: BorderRadius.circular(
                        FetchPixels.getPixelWidth(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.description,
                              color: R.colors.primaryColor,
                              size: FetchPixels.getPixelHeight(20),
                            ),
                            getHorSpace(8),
                            simpleText(
                              "Description",
                              style: R.textStyle.semiBoldInter().copyWith(
                                fontSize: 14,
                                color: R.colors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        getVerSpace(10),
                        simpleText(
                          "Monthly electricity bill for April 2025. Payment includes standard residential rates and taxes for the current billing cycle.",
                          style: R.textStyle.mediumInter().copyWith(
                            fontSize: 13,
                            color: R.colors.textColor,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            getVerSpace(30),
            Row(
              children: [
                Expanded(
                  child: MyContainer(
                    padding: EdgeInsets.symmetric(
                      vertical: FetchPixels.getPixelHeight(15),
                    ),
                    margin: EdgeInsets.only(right: FetchPixels.getPixelWidth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: R.colors.primaryColor,
                          size: FetchPixels.getPixelHeight(20),
                        ),
                        getHorSpace(8),
                        simpleText(
                          "Edit",
                          style: R.textStyle.semiBoldInter().copyWith(
                            fontSize: 14,
                            color: R.colors.primaryColor,
                          ),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.delete,
                          color: R.colors.redColor,
                          size: FetchPixels.getPixelHeight(20),
                        ),
                        getHorSpace(8),
                        simpleText(
                          "Delete",
                          style: R.textStyle.semiBoldInter().copyWith(
                            fontSize: 14,
                            color: R.colors.redColor,
                          ),
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
