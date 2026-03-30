import "package:expenzo/base/resizer/constant.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../../../base/resizer/fetch_pixels.dart";
import "../../../base/resizer/widget_utils.dart";
import "dart:math" as math;

import "../../../resources/resources.dart";

class SemiCircle extends StatefulWidget {
  final bool isOpen;

  const SemiCircle({super.key, required this.isOpen});

  @override
  State<SemiCircle> createState() => SemiCircleState();
}

class SemiCircleState extends State<SemiCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  @override
  void didUpdateWidget(covariant SemiCircle oldWidget) {
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
      duration: Duration(milliseconds: 500),
    );

    scaleAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animationController, curve: Curves.ease));

    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Interval(0.30, 0.95, curve: Curves.linear),
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: scaleAnimation.value,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CustomPaint(
                size: Size(
                  FetchPixels.getPixelWidth(330),
                  FetchPixels.getPixelHeight(230),
                ),
                painter: MyPainter(),
              ),
              Positioned(
                bottom: FetchPixels.getPixelHeight(165),
                child: FadeTransition(
                  opacity: opacityAnimation,
                  child: Row(
                    spacing: FetchPixels.getPixelWidth(125),
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(R.icons.setBudgetIcon),
                            getVerSpace(5),
                            simpleText(
                              "Set Budget",
                              style: R.textStyle.regularInter().copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(R.icons.addExpenseIcon),
                            getVerSpace(5),
                            simpleText(
                              "Add Expense",
                              style: R.textStyle.regularInter().copyWith(
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = FetchPixels.getPixelWidth(95)
      ..style = PaintingStyle.stroke;

    Path path = Path();

    double maxWidth = size.width * FetchPixels.getPixelWidth(0.8);
    double maxHeight = size.height;

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawShadow(
      path,
      R.colors.blackColor.withValues(alpha: Constant.getOpacityValues(100)),
      20.0,
      false,
    );

    canvas.drawArc(
      Rect.fromCenter(center: center, width: maxWidth, height: maxHeight),
      math.pi,
      math.pi,
      false,
      paint,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
