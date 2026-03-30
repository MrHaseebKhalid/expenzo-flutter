import "package:flutter/material.dart";
import "../../../widgets/my_app_bar2.dart";

class Overview extends StatelessWidget {
  const Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        MyAppBar2(
          titleText: "Hello, Mark",
          isSettingsIcon: true,
          isBellIcon: true,
        ),
      ],
    );
  }
}
