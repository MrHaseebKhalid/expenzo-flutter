import "package:expenzo/widgets/my_app_bar2.dart";
import "package:flutter/material.dart";
import "../../../base/resizer/fetch_pixels.dart";

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: FetchPixels.getPixelHeight(20),
              horizontal: FetchPixels.getPixelWidth(25),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyAppBar2(
                  titleText: "Hello, Mark",
                  isSettingsIcon: true,
                  isBellIcon: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
