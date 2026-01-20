import "package:expenzo/screens/app/analytics/analytics_view.dart";
import "package:expenzo/screens/app/dashboard/dashboard_view.dart";
import "package:expenzo/screens/app/overview/overview.dart";
import "package:expenzo/screens/app/profile/profile_view.dart";
import "package:expenzo/screens/app/provider/app_provider.dart";
import "package:expenzo/screens/app/widgets/bottom_app_bar.dart";
import "package:expenzo/screens/app/widgets/floating_action_button.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "../../base/resizer/fetch_pixels.dart";
import "../../resources/resources.dart";
import "../../widgets/my_app_bar2.dart";

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    var appProvider = context.read<AppProvider>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: MyFloatingActionButton(),
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
              selector: (context, appProvider ) => appProvider.currentPageIndex,
              builder: (context, value, child) => IndexedStack(
                index: appProvider.currentPageIndex,
                children: [Overview(), DashboardView(), AnalyticsView(),
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
