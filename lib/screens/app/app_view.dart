import "package:expenzo/resources/resources.dart";
import "package:expenzo/screens/app/analytics/analytics_view.dart";
import "package:expenzo/screens/app/dashboard/dashboard_view.dart";
import "package:expenzo/screens/app/overview/overview_view.dart";
import "package:expenzo/screens/app/profile/profile_view.dart";
import "package:expenzo/screens/app/provider/app_provider.dart";
import "package:expenzo/screens/app/widgets/bottom_app_bar.dart";
import "package:expenzo/screens/app/widgets/floating_action_button.dart";
import "package:expenzo/screens/app/widgets/semi_circle.dart";
import "package:expenzo/screens/auth/provider/auth_provider.dart";
import "package:expenzo/widgets/my_app_bar2.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "../../base/resizer/fetch_pixels.dart";

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  bool isOpen = false;

  PreferredSizeWidget _buildResponsiveAppBar(BuildContext context, int index) {
    final screenWidth = FetchPixels.width;
    final titleFontSize = screenWidth < 360 ? 18.0 : 21.0;

    switch (index) {
      case 0:
        return MyAppBar2(
          titleText: "Hello, ${AuthProvider().userFirstName}",
          titleFontSize: titleFontSize,
          isBellIcon: true,
          isSettingsIcon: true,
        );
      case 1:
        return MyAppBar2(
          titleText: R.strings.appName,
          titleFontSize: titleFontSize,
          isSettingsIcon: true,
          isBellIcon: true,
        );
      case 2:
        return MyAppBar2(
          titleText: R.strings.appName,
          titleFontSize: titleFontSize,
          isBellIcon: true,
          isSettingsIcon: true,
        );
      case 3:
      default:
        return MyAppBar2(
          titleText: "Profile",
          titleFontSize: titleFontSize,
          isSettingsIcon: true,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentPageIndex = context.select<AppProvider, int>(
      (appProvider) => appProvider.currentPageIndex,
    );

    return Scaffold(
      appBar: _buildResponsiveAppBar(context, currentPageIndex),
      resizeToAvoidBottomInset: false,
      floatingActionButton: MyFloatingActionButton(
        isOpen: isOpen,
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: MyBottomAppBar(),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: FetchPixels.getPixelWidth(25),
                  ),
                  child: Selector<AppProvider, int>(
                    selector: (context, appProvider) =>
                        appProvider.currentPageIndex,
                    builder: (context, value, child) =>
                        DynamicIndexedStack(
                          index: value,
                          children: [
                            Overview(),
                            DashboardView(),
                            AnalyticsView(),
                            ProfileView(),
                          ],
                        ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: FetchPixels.getPixelHeight(-120),
            left: FetchPixels.getPixelWidth(0),
            right: FetchPixels.getPixelWidth(0),
            child: SemiCircle(isOpen: isOpen),
          ),
        ],
      ),
    );
  }
}

class DynamicIndexedStack extends StatelessWidget {
  final int index;
  final List<Widget> children;

  const DynamicIndexedStack({
    super.key,
    required this.index,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List<Widget>.generate(children.length, (i) {
        return Visibility(
          visible: index == i,
          maintainState: true, // Preserves your screen's content & scroll state
          maintainSize:
              false, // CRITICAL: Frees up the extra height/width space
          maintainAnimation: true,
          child: children[i],
        );
      }),
    );
  }
}
