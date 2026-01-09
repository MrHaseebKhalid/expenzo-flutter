import 'package:flutter/cupertino.dart';
import '../resources/resources.dart';

class AppTextStyle {
  TextStyle regularInter() {
    return TextStyle(
      fontSize: 14,
      fontFamily: 'Inter',
      letterSpacing: 0,
      color: R.colors.textColor,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle mediumInter() {
    return TextStyle(
      fontSize: 15,
      fontFamily: 'Inter',
      letterSpacing: 0,
      color: R.colors.textColor,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle semiBoldInter() {
    return TextStyle(
      fontSize: 17,
      fontFamily: 'Inter',
      letterSpacing: 0,
      color: R.colors.textColor,
      fontWeight: FontWeight.w600,
    );
  }

  TextStyle boldInter() {
    return TextStyle(
      fontSize: 18,
      fontFamily: 'Inter',
      letterSpacing: 0,
      color: R.colors.textColor,
      fontWeight: FontWeight.w700,
    );
  }
}
