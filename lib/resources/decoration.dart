import 'package:expenzo/resources/resources.dart';
import 'package:flutter/material.dart';

import '../base/resizer/fetch_pixels.dart';

class AppDecoration {
  final InputBorder enabledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(FetchPixels.getPixelHeight(100.0)),
    ),
    borderSide: BorderSide(
      color: R.colors.lightGreyColor,
      width: FetchPixels.getPixelHeight(0.0),
    ),
  );

  final InputBorder focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(FetchPixels.getPixelHeight(100.0)),
    ),
    borderSide: BorderSide(
      color: R.colors.primaryColor,
      width: FetchPixels.getPixelHeight(2.0),
    ),
  );

  final InputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(FetchPixels.getPixelHeight(100.0)),
    ),
    borderSide: BorderSide(
      color: R.colors.redColor,
      width: FetchPixels.getPixelHeight(2.0),
    ),
  );
}
