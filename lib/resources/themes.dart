import 'package:expenzo/resources/resources.dart';
import 'package:flutter/material.dart';

class AppThemes {
  final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: R.colors.bgColor,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: R.colors.primaryColor,
      selectionHandleColor: R.colors.primaryColor,
      selectionColor: R.colors.primaryColor.withValues(alpha: 0.2),
    ),
  );
  final darkTheme = ThemeData(brightness: Brightness.dark);
}
