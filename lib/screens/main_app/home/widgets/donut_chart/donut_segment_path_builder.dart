import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Builds a closed path for one rounded annular donut segment.
class DonutSegmentPathBuilder {
  const DonutSegmentPathBuilder._();

  /// Returns a path for a single segment with four rounded corners.
  static Path build({
    required Offset center,
    required double innerRadius,
    required double outerRadius,
    required double startAngle,
    required double sweepAngle,
    required double cornerRadius,
  }) {
    if (sweepAngle <= 0) {
      return Path();
    }

    final path = Path();
    final effectiveCorner = _clampCornerRadius(
      cornerRadius: cornerRadius,
      innerRadius: innerRadius,
      outerRadius: outerRadius,
      sweepAngle: sweepAngle,
    );

    if (effectiveCorner <= 0 || sweepAngle < 0.02) {
      _addPlainSegment(
        path,
        center: center,
        innerRadius: innerRadius,
        outerRadius: outerRadius,
        startAngle: startAngle,
        sweepAngle: sweepAngle,
      );
      return path;
    }

    final outerAngularInset = effectiveCorner / outerRadius;
    final innerAngularInset = effectiveCorner / innerRadius;
    final maxAngularInset = (sweepAngle * 0.45).clamp(0.0, sweepAngle / 2);
    final outerInset = math.min(outerAngularInset, maxAngularInset);
    final innerInset = math.min(innerAngularInset, maxAngularInset);

    final endAngle = startAngle + sweepAngle;
    final outerRect = Rect.fromCircle(center: center, radius: outerRadius);
    final innerRect = Rect.fromCircle(center: center, radius: innerRadius);

    // Start on outer arc, just past the outer-start corner.
    final outerArcStart = startAngle + outerInset;
    path.moveTo(_polar(center, outerRadius, outerArcStart).dx,
        _polar(center, outerRadius, outerArcStart).dy);

    // Outer arc toward the outer-end corner.
    path.arcTo(
      outerRect,
      outerArcStart,
      (endAngle - outerInset) - outerArcStart,
      false,
    );

    // Outer-end corner: outer arc → radial edge inward.
    path.quadraticBezierTo(
      _polar(center, outerRadius, endAngle).dx,
      _polar(center, outerRadius, endAngle).dy,
      _polar(center, outerRadius - effectiveCorner, endAngle).dx,
      _polar(center, outerRadius - effectiveCorner, endAngle).dy,
    );

    // Radial edge at end angle (outer → inner).
    path.lineTo(
      _polar(center, innerRadius + effectiveCorner, endAngle).dx,
      _polar(center, innerRadius + effectiveCorner, endAngle).dy,
    );

    // Inner-end corner: radial edge → inner arc.
    path.quadraticBezierTo(
      _polar(center, innerRadius, endAngle).dx,
      _polar(center, innerRadius, endAngle).dy,
      _polar(center, innerRadius, endAngle - innerInset).dx,
      _polar(center, innerRadius, endAngle - innerInset).dy,
    );

    // Inner arc back toward inner-start (counter-clockwise = short return path).
    path.arcTo(
      innerRect,
      endAngle - innerInset,
      -((endAngle - innerInset) - (startAngle + innerInset)),
      false,
    );

    // Inner-start corner: inner arc → radial edge outward.
    path.quadraticBezierTo(
      _polar(center, innerRadius, startAngle).dx,
      _polar(center, innerRadius, startAngle).dy,
      _polar(center, innerRadius + effectiveCorner, startAngle).dx,
      _polar(center, innerRadius + effectiveCorner, startAngle).dy,
    );

    // Radial edge at start angle (inner → outer).
    path.lineTo(
      _polar(center, outerRadius - effectiveCorner, startAngle).dx,
      _polar(center, outerRadius - effectiveCorner, startAngle).dy,
    );

    // Outer-start corner: radial edge → outer arc (close).
    path.quadraticBezierTo(
      _polar(center, outerRadius, startAngle).dx,
      _polar(center, outerRadius, startAngle).dy,
      _polar(center, outerRadius, outerArcStart).dx,
      _polar(center, outerRadius, outerArcStart).dy,
    );

    path.close();
    return path;
  }

  static double _clampCornerRadius({
    required double cornerRadius,
    required double innerRadius,
    required double outerRadius,
    required double sweepAngle,
  }) {
    final thickness = outerRadius - innerRadius;
    final outerArcLength = outerRadius * sweepAngle;
    final innerArcLength = innerRadius * sweepAngle;
    return cornerRadius.clamp(
      0.0,
      math.min(thickness / 2 - 0.5, math.min(outerArcLength / 2, innerArcLength / 2)),
    );
  }

  static void _addPlainSegment(
    Path path, {
    required Offset center,
    required double innerRadius,
    required double outerRadius,
    required double startAngle,
    required double sweepAngle,
  }) {
    final endAngle = startAngle + sweepAngle;
    final outerRect = Rect.fromCircle(center: center, radius: outerRadius);
    final innerRect = Rect.fromCircle(center: center, radius: innerRadius);

    path.moveTo(
      _polar(center, outerRadius, startAngle).dx,
      _polar(center, outerRadius, startAngle).dy,
    );
    path.arcTo(outerRect, startAngle, sweepAngle, false);
    path.lineTo(
      _polar(center, innerRadius, endAngle).dx,
      _polar(center, innerRadius, endAngle).dy,
    );
    path.arcTo(innerRect, endAngle, -sweepAngle, false);
    path.close();
  }

  static Offset _polar(Offset center, double radius, double angle) {
    return Offset(
      center.dx + radius * math.cos(angle),
      center.dy + radius * math.sin(angle),
    );
  }
}
