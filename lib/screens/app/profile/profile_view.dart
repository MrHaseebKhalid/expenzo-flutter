import "package:flutter/material.dart";

import "../../../widgets/my_app_bar2.dart";

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [MyAppBar2(titleText: "Profile", isSettingsIcon: true)],
    );
  }
}
