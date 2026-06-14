import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Visual configuration for [ExpenseDonutChart].
///
/// Every drawable property is controlled here — nothing is hardcoded in the painter.
class DonutChartConfig {

// All the variables defined here that are using in the chart. It is control center.
  final double innerRadius;
  final double outerRadius;
  final double segmentGap;
  final double cornerRadius;
  final int animationDuration;
  final int valueChangeAnimationDuration;
  final int pulseAnimationDuration;
  final bool showPercentageLabels;
  final TextStyle percentageLabelStyle;
  final double startAngleOffsetRadians;
  final Curve loadAnimationCurve;
  final Curve valueChangeAnimationCurve;
  final double pulseScalePeak;

  const DonutChartConfig({
    this.innerRadius = 70.0,
    this.outerRadius = 120.0,
    this.segmentGap = 3.0,
    this.cornerRadius = 15.0,
    this.animationDuration = 900,
    this.valueChangeAnimationDuration = 600,
    this.pulseAnimationDuration = 400,
    this.showPercentageLabels = true,
    this.percentageLabelStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 13,
    ),
    this.startAngleOffsetRadians = -math.pi / 2,
    this.loadAnimationCurve = Curves.easeOutCubic,
    this.valueChangeAnimationCurve = Curves.easeInOutCubic,
    this.pulseScalePeak = 1.03,
  });

// These are the getters for convience:
  Duration get loadDuration => Duration(milliseconds: animationDuration);

  Duration get valueChangeDuration =>
      Duration(milliseconds: valueChangeAnimationDuration);

  Duration get pulseDuration => Duration(milliseconds: pulseAnimationDuration);
}
