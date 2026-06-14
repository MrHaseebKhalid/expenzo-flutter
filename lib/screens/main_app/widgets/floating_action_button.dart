import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../../../resources/resources.dart";
import "dart:math" as math;

class MyFloatingActionButton extends StatefulWidget {
  final bool isOpen;
  final VoidCallback onTap;

  const MyFloatingActionButton({
    required this.onTap,
    super.key,
    required this.isOpen,
  });

  @override
  State<MyFloatingActionButton> createState() => MyFloatingActionButtonState();
}

class MyFloatingActionButtonState extends State<MyFloatingActionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotateAnimation;

  @override
  void didUpdateWidget(covariant MyFloatingActionButton oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isOpen != widget.isOpen) {
      if (widget.isOpen) {
        animationController.forward();
      } else {
        animationController.reverse();
      }
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    );

    rotateAnimation = Tween(
      begin: 0.0,
      end: math.pi + (math.pi / 4),
    ).animate(animationController);

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: widget.onTap,
      backgroundColor: R.colors.primaryColor,
      shape: CircleBorder(),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform.rotate(
            angle: rotateAnimation.value,
            child: SvgPicture.asset(R.icons.plusIcon),
          );
        },
      ),
    );
  }
}
