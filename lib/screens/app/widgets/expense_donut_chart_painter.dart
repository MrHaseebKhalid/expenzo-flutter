import 'dart:math' as math;

import 'package:expenzo/screens/app/widgets/donut_chart_config.dart';
import 'package:expenzo/screens/app/widgets/donut_segment.dart';
import 'package:expenzo/screens/app/widgets/donut_segment_path_builder.dart';
import 'package:flutter/material.dart';

/// Paints rounded annular segments and optional percentage labels.
class ExpenseDonutChartPainter extends CustomPainter {
  ExpenseDonutChartPainter({
    required this.segments,
    required this.config,
    required this.animatedSweepsRadians,
    required this.startAnglesRadians,
    required this.percentages,
  });

  final List<DonutSegment> segments;
  final DonutChartConfig config;
  final List<double> animatedSweepsRadians;
  final List<double> startAnglesRadians;
  final List<double> percentages;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final scale = size.width / (config.outerRadius * 2);
    final innerRadius = config.innerRadius * scale;
    final outerRadius = config.outerRadius * scale;
    final cornerRadius = config.cornerRadius * scale;
    final gapRadians = config.segmentGap * math.pi / 180;

    canvas.save();
    canvas.translate(center.dx, center.dy);

    // ── Segment fills ──────────────────────────────────────────────────────
    for (var i = 0; i < segments.length; i++) {
      final sweep = animatedSweepsRadians[i];
      if (sweep <= 0) {
        continue;
      }

      final gapPerSide = math.min(gapRadians / 2, sweep / 4);
      final drawSweep = sweep - gapRadians;
      if (drawSweep <= 0) {
        continue;
      }

      final segmentPath = DonutSegmentPathBuilder.build(
        center: Offset.zero,
        innerRadius: innerRadius,
        outerRadius: outerRadius,
        startAngle: startAnglesRadians[i] + gapPerSide,
        sweepAngle: drawSweep,
        cornerRadius: cornerRadius,
      );

      canvas.drawPath(
        segmentPath,
        Paint()
          ..color = segments[i].color
          ..style = PaintingStyle.fill
          ..isAntiAlias = true,
      );
    }

    // ── Percentage labels ───────────────────────────────────────────────────
    if (config.showPercentageLabels) {
      _paintPercentageLabels(
        canvas,
        innerRadius: innerRadius,
        outerRadius: outerRadius,
      );
    }

    canvas.restore();
  }

  void _paintPercentageLabels(
    Canvas canvas, {
    required double innerRadius,
    required double outerRadius,
  }) {
    final labelRadius = (innerRadius + outerRadius) / 2;
    final minSweepForLabel = 0.12;

    for (var i = 0; i < segments.length; i++) {
      final sweep = animatedSweepsRadians[i];
      if (sweep < minSweepForLabel || percentages[i] < 0.5) {
        continue;
      }

      final midAngle = startAnglesRadians[i] + sweep / 2;
      final labelPosition = Offset(
        labelRadius * math.cos(midAngle),
        labelRadius * math.sin(midAngle),
      );

      final text = '${percentages[i].round()}%';
      final textPainter = TextPainter(
        text: TextSpan(text: text, style: config.percentageLabelStyle),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        labelPosition - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant ExpenseDonutChartPainter oldDelegate) {
    return oldDelegate.segments != segments ||
        oldDelegate.config != config ||
        !_listEquals(oldDelegate.animatedSweepsRadians, animatedSweepsRadians) ||
        !_listEquals(oldDelegate.startAnglesRadians, startAnglesRadians) ||
        !_listEquals(oldDelegate.percentages, percentages);
  }

  bool _listEquals(List<double> a, List<double> b) {
    if (a.length != b.length) {
      return false;
    }
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) {
        return false;
      }
    }
    return true;
  }
}
