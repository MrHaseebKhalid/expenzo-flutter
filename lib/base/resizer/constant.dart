import 'package:flutter/material.dart';

class Constant {
  static backToPrev(BuildContext context) {
    return Navigator.of(context).pop();
  }

  static moveToNext(BuildContext context, Widget nextScreen) {
    return Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => nextScreen));
  }

  static double getOpacityValues(double percentage) {
    return (percentage / 100);
  }
}
