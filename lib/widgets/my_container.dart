import "package:expenzo/base/resizer/constant.dart";
import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:flutter/material.dart";
import "../resources/resources.dart";

class MyContainer extends StatelessWidget {
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? childAlignment;
  final double? containerHeight;
  final double? containerWidth;
  final Widget? child;

  const MyContainer({
    super.key,
    this.borderRadius,
    this.padding,
    this.margin,
    this.childAlignment,
    this.containerHeight,
    this.containerWidth,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: childAlignment ?? Alignment.center,
      height: containerHeight,
      width: containerWidth,
      padding:
          padding ??
          EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(10),
            vertical: FetchPixels.getPixelHeight(10),
          ),
      margin:
          margin ??
          EdgeInsets.symmetric(
            horizontal: FetchPixels.getPixelWidth(10),
            vertical: FetchPixels.getPixelHeight(10),
          ),
      decoration: BoxDecoration(
        color: R.colors.whiteColor,
        borderRadius: BorderRadius.circular(
          FetchPixels.getPixelHeight(borderRadius ?? 16),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 20,
            color: R.colors.blackColor.withValues(
              alpha: Constant.getOpacityValues(5),
            ),
          ),
        ],
      ),
      child: child,
    );
  }
}
