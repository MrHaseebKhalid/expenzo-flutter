import "package:flutter/material.dart";

import "../../../resources/resources.dart";
import "../../../widgets/my_app_bar2.dart";

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyAppBar2(
          titleText: R.strings.appName,
          isSettingsIcon: true,
          isBellIcon: true,
        ),
      ],
    );
  }
}
