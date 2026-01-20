import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "../../../resources/resources.dart";

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: R.colors.primaryColor,
      shape: CircleBorder(),
      child: SvgPicture.asset(R.icons.plusIcon),
    );
  }
}
