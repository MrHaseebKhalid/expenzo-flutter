import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:provider/provider.dart";

import "../../../base/resizer/fetch_pixels.dart";
import "../../../resources/resources.dart";
import "../provider/app_provider.dart";

class MyBottomAppBar extends StatelessWidget {
  const MyBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = context.read<AppProvider>();
    return BottomAppBar(
      color: R.colors.primaryColor,
      notchMargin: 7.0,
      elevation: 0.0,
      height: FetchPixels.getPixelHeight(70),
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: FetchPixels.getPixelWidth(5)),
        child: Selector<AppProvider, int>(
          selector: (context, appProvider) => appProvider.currentPageIndex,
          builder: (context, index, child) => Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: FetchPixels.getPixelHeight(50),
                    width: FetchPixels.getPixelWidth(50),
                    child: IconButton(
                      onPressed: () {
                        if (appProvider.currentPageIndex != 0) {
                          appProvider.changePageIndex(0);
                        }
                      },
                      icon: SvgPicture.asset(
                        R.icons.homeIcon,
                        height: FetchPixels.getPixelHeight(
                          (index == 0) ? 36 : 23,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: FetchPixels.getPixelHeight(50),
                    width: FetchPixels.getPixelWidth(50),
                    child: IconButton(
                      onPressed: () {
                        if (appProvider.currentPageIndex != 1) {
                          appProvider.changePageIndex(1);
                        }
                      },
                      icon: SvgPicture.asset(
                        R.icons.dashboardIcon,
                        height: FetchPixels.getPixelHeight(
                          (index == 1) ? 25 : 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 20,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: FetchPixels.getPixelHeight(50),
                    width: FetchPixels.getPixelWidth(50),
                    child: IconButton(
                      onPressed: () {
                        if (appProvider.currentPageIndex != 2) {
                          appProvider.changePageIndex(2);
                        }
                      },
                      icon: SvgPicture.asset(
                        R.icons.analyticsIcon,
                        height: FetchPixels.getPixelHeight(
                          (index == 2) ? 25 : 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: FetchPixels.getPixelHeight(50),
                    width: FetchPixels.getPixelWidth(50),
                    child: IconButton(
                      onPressed: () {
                        if (appProvider.currentPageIndex != 3) {
                          appProvider.changePageIndex(3);
                        }
                      },
                      icon: SvgPicture.asset(
                        R.icons.profileIcon1,
                        height: FetchPixels.getPixelHeight(
                          (index == 3) ? 25 : 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
