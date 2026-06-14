import "package:expenzo/base/resizer/fetch_pixels.dart";
import "package:expenzo/base/widget_utils.dart";
import "package:expenzo/resources/resources.dart";
import "package:flutter/material.dart";

class DonutChartPill extends StatelessWidget {
  final String text;
  final Color color;
  const DonutChartPill({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        simpleText(
          text,
          style: R.textStyle.semiBoldInter().copyWith(
            color: color,
            fontSize: 14,
          ),
        ),
        getVerSpace(10),
        Container(
          height: FetchPixels.getPixelHeight(10),
          width: FetchPixels.getPixelWidth(30),

          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(FetchPixels.getPixelHeight(5)),
              bottomRight: Radius.circular(FetchPixels.getPixelHeight(5)),
              topRight: Radius.circular(FetchPixels.getPixelHeight(20)),
              topLeft: Radius.circular(FetchPixels.getPixelHeight(20)),
            ),
          ),
        ),
      ],
    );
  }
}
