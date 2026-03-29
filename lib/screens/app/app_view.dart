import "package:expenzo/screens/app/analytics/analytics_view.dart";
import "package:expenzo/screens/app/dashboard/dashboard_view.dart";
import "package:expenzo/screens/app/overview/overview.dart";
import "package:expenzo/screens/app/profile/profile_view.dart";
import "package:expenzo/screens/app/provider/app_provider.dart";
import "package:expenzo/screens/app/widgets/bottom_app_bar.dart";
import "package:expenzo/screens/app/widgets/floating_action_button.dart";
import "package:expenzo/screens/app/widgets/overlay_semi_circle.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../base/resizer/fetch_pixels.dart";

final GlobalKey<OverlaySemiCircleState> overlayKey = GlobalKey();

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late OverlayEntry overlayEntry;
  bool isOpen = false;

  void openSemiCircle() {
    overlayEntry = OverlayEntry(
      builder: (context) {
        return OverlaySemiCircle(key: overlayKey);
      },
    );

    Overlay.of(context).insert(overlayEntry);
    isOpen = true;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      overlayKey.currentState?.startAnimation();
    });
  }

  void closeSemiCircle() {
    overlayKey.currentState?.startAnimation();
    Future.delayed(Duration(milliseconds: 1000), () {
    overlayEntry.remove();
    isOpen = false;
    },);
  }

  @override
  Widget build(BuildContext context) {
    var appProvider = context.read<AppProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: MyFloatingActionButton(
        onTap: () {
          if (isOpen) {
            closeSemiCircle();
          } else {
            openSemiCircle();
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: MyBottomAppBar(),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: FetchPixels.getPixelHeight(20),
              horizontal: FetchPixels.getPixelWidth(25),
            ),
            child: Selector<AppProvider, int>(
              selector: (context, appProvider) => appProvider.currentPageIndex,
              builder: (context, value, child) => IndexedStack(
                index: appProvider.currentPageIndex,
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
    );
  }
}
