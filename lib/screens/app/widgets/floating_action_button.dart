import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";

import "../../../resources/resources.dart";

class MyFloatingActionButton extends StatelessWidget {
  final VoidCallback onTap;

  const MyFloatingActionButton({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onTap,
      backgroundColor: R.colors.primaryColor,
      shape: CircleBorder(),
      child: SvgPicture.asset(R.icons.plusIcon),
    );
  }
}
