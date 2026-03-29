import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/resizer/widget_utils.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../../../resources/resources.dart";
import "dart:math" as math;

class OverlaySemiCircle extends StatefulWidget {
  const OverlaySemiCircle({super.key});

  @override
  State<OverlaySemiCircle> createState() => OverlaySemiCircleState();
}

class OverlaySemiCircleState extends State<OverlaySemiCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;

  void startAnimation() {
    if (scaleAnimation.value == 0.0) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
  }

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
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
    return Positioned(
      bottom: FetchPixels.getPixelHeight(205),
      left: FetchPixels.getPixelWidth(30),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: scaleAnimation.value,
            child: Stack(
              alignment: Alignment.center,
              children: [
                IgnorePointer(
                  ignoring: true,
                  child: Container(color: R.colors.transparent),
                ),
                CustomPaint(
                  size: Size(
                    FetchPixels.getPixelWidth(330),
                    FetchPixels.getPixelHeight(230),
                  ),
                  painter: MyPainter(),
                ),
                Positioned(
                  top: FetchPixels.getPixelHeight(6),
                  child: FadeTransition(
                    opacity: opacityAnimation,
                    child: Row(
                      spacing: FetchPixels.getPixelWidth(120),
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(R.icons.setBudgetIcon),
                            getVerSpace(5),
                            simpleText("Set Budget"),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(R.icons.addExpenseIcon),
                            getVerSpace(5),
                            simpleText("Add expense"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = FetchPixels.getPixelWidth(90)
      ..style = PaintingStyle.stroke;

    Path path = Path();

    double maxWidth = size.width * FetchPixels.getPixelWidth(0.8);
    double maxHeight = size.height;

    Offset center = Offset(size.width / 2, size.height / 2);

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
