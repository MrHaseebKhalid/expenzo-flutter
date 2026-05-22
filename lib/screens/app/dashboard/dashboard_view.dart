import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:expenzo/widgets/my_container.dart";
import "package:flutter/material.dart";

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

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

        MyContainer(
          padding: EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(20),
            vertical: FetchPixels.getPixelHeight(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  // Gray track shadow/glow effect underneath
                  Container(
                    width: FetchPixels.getPixelWidth(140),
                    height: FetchPixels.getPixelHeight(140),
                    decoration: BoxDecoration(
                      border: Border.all(width: 10.0,
                      color: R.colors.whiteColor
                      ),
                      shape: BoxShape.circle,
                      
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: Constant.getOpacityValues(10),
                          ),
                          offset: Offset(10, 0),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                        BoxShadow(
                          color: Colors.black.withValues(
                            alpha: Constant.getOpacityValues(10),
                          ),
                          offset: Offset(-10, 0),
                          blurRadius: 15,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                  ),
                  // The Actual Progress Ring
                  //     SizedBox(
                  //       width: FetchPixels.getPixelWidth(100),
                  //       height: FetchPixels.getPixelHeight(100),
                  //       child: const CircularProgressIndicator(
                  //         value: 0.78,
                  //         strokeWidth: 12, // Controls thickness of the ring
                  //         strokeCap: StrokeCap.round, // Makes the bar ends round
                  //         backgroundColor: Colors.white, // Hollow center/track fill
                  //         valueColor: AlwaysStoppedAnimation<Color>(
                  //           Color(0xFF1E60E2),
                  //         ),
                  //       ),
                  //     ),
                  //     // Percentage Text Center Layer
                  //     Text(
                  //       '${(100).toInt()}%',
                  //       style: TextStyle(
                  //         fontSize: FetchPixels.getPixelHeight(20),
                  //         fontWeight: FontWeight.w600,
                  //         color: Colors.black,
                  //       ),
                  //     ),
                ],
              ),
              SizedBox(height: FetchPixels.getPixelHeight(16)),
              // Bottom Label Text
              Text(
                'Food',
                style: TextStyle(
                  fontSize: FetchPixels.getPixelHeight(18),
                  fontWeight: FontWeight.w600,
                  color: R.colors.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
