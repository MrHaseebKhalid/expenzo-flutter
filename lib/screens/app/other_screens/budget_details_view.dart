import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_back_button.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class BudgetDetailsView extends StatelessWidget {
  const BudgetDetailsView({super.key});

  Widget _buildCategoryCard({
    required IconData icon,
    required String name,
    required String amount,
    required Color color,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: MyContainer(
        padding: EdgeInsets.symmetric(
          horizontal: FetchPixels.getPixelWidth(15),
          vertical: FetchPixels.getPixelHeight(20),
        ),
        margin: EdgeInsets.zero,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: FetchPixels.getPixelHeight(32)),
            getVerSpace(12),
            simpleText(
              name,
              style: R.textStyle.semiBoldInter().copyWith(
                fontSize: 13,
                color: color,
              ),
            ),
            getVerSpace(8),
            simpleText(
              amount,
              style: R.textStyle.boldInter().copyWith(
                fontSize: 16,
                color: R.colors.textColor,
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
      appBar: AppBar(
        leading: MyBackButton(onTap: () => Navigator.pop(context)),
        title: simpleText(
          "Budget details",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    simpleText(
                      "Budget Month : ",
                      style: R.textStyle.mediumInter().copyWith(fontSize: 14),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: FetchPixels.getPixelWidth(12),
                        vertical: FetchPixels.getPixelHeight(8),
                      ),
                      decoration: BoxDecoration(
                        color: R.colors.lightGreyColor,
                        borderRadius: BorderRadius.circular(
                          FetchPixels.getPixelWidth(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          simpleText(
                            "current (default)",
                            style: R.textStyle.mediumInter().copyWith(
                              fontSize: 13,
                            ),
                          ),
                          getHorSpace(5),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: FetchPixels.getPixelHeight(16),
                            color: R.colors.dimTextColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.edit,
                  color: R.colors.primaryColor,
                  size: FetchPixels.getPixelHeight(22),
                ),
              ],
            ),
            getVerSpace(25),
            MyContainer(
              padding: EdgeInsets.symmetric(
                horizontal: FetchPixels.getPixelWidth(20),
                vertical: FetchPixels.getPixelHeight(30),
              ),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  simpleText(
                    "Total Budget",
                    style: R.textStyle.mediumInter().copyWith(
                      fontSize: 14,
                      color: R.colors.dimTextColor,
                    ),
                  ),
                  getVerSpace(10),
                  simpleText(
                    "\$2000",
                    style: R.textStyle.boldInter().copyWith(
                      fontSize: 32,
                      color: R.colors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            getVerSpace(25),
            simpleText(
              "Sub categories",
              style: R.textStyle.boldInter().copyWith(fontSize: 18),
            ),
            getVerSpace(20),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              mainAxisSpacing: FetchPixels.getPixelHeight(15),
              crossAxisSpacing: FetchPixels.getPixelWidth(15),
              childAspectRatio: 0.9,
              children: [
                _buildCategoryCard(
                  icon: Icons.restaurant,
                  name: "Food",
                  amount: "\$2304",
                  color: R.colors.primaryColor,
                  onTap: () {
                    Constant.navigateToRoute(context, '/expense-details');
                  },
                ),
                _buildCategoryCard(
                  icon: Icons.directions_car,
                  name: "Transport",
                  amount: "\$850",
                  color: const Color(0xFFFF9800),
                  onTap: () {
                    Constant.navigateToRoute(context, '/expense-details');
                  },
                ),
                _buildCategoryCard(
                  icon: Icons.receipt_long,
                  name: "Bills",
                  amount: "\$1200",
                  color: const Color(0xFF9C27B0),
                  onTap: () {
                    Constant.navigateToRoute(context, '/expense-details');
                  },
                ),
                _buildCategoryCard(
                  icon: Icons.shopping_bag,
                  name: "Shopping",
                  amount: "\$650",
                  color: const Color(0xFFE91E63),
                  onTap: () {
                    Constant.navigateToRoute(context, '/expense-details');
                  },
                ),
                _buildCategoryCard(
                  icon: Icons.local_hospital,
                  name: "Health",
                  amount: "\$400",
                  color: const Color(0xFF00BCD4),
                  onTap: () {
                    Constant.navigateToRoute(context, '/expense-details');
                  },
                ),
                _buildCategoryCard(
                  icon: Icons.casino,
                  name: "Entertainment",
                  amount: "\$300",
                  color: const Color(0xFFE040FB),
                  onTap: () {
                    Constant.navigateToRoute(context, '/expense-details');
                  },
                ),
                _buildCategoryCard(
                  icon: Icons.work,
                  name: "Others",
                  amount: "\$200",
                  color: const Color(0xFF009688),
                  onTap: () {
                    Constant.navigateToRoute(context, '/expense-details');
                  },
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
