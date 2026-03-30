import "package:expenzo/screens/app/analytics/analytics_view.dart";
import "package:expenzo/screens/app/dashboard/dashboard_view.dart";
import "package:expenzo/screens/app/overview/overview.dart";
import "package:expenzo/screens/app/profile/profile_view.dart";
import "package:expenzo/screens/app/provider/app_provider.dart";
import "package:expenzo/screens/app/widgets/bottom_app_bar.dart";
import "package:expenzo/screens/app/widgets/floating_action_button.dart";
import "package:expenzo/screens/app/widgets/semi_circle.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../base/resizer/fetch_pixels.dart";
import "../../resources/resources.dart";

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    var appProvider = context.read<AppProvider>();
    return Scaffold(
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
                    vertical: FetchPixels.getPixelHeight(20),
                    horizontal: FetchPixels.getPixelWidth(25),
                  ),
                  child: Selector<AppProvider, int>(
                    selector: (context, appProvider) =>
                        appProvider.currentPageIndex,
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
