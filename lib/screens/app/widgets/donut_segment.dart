import 'package:flutter/material.dart';

/// A single slice of the expense donut chart.
class DonutSegment {
  const DonutSegment({
    required this.label,
    required this.value,
    required this.color,
    this.emoji = '',
  });

  final String label;
  final double value;
  final Color color;
  final String emoji;

  DonutSegment copyWith({
    String? label,
    double? value,
    Color? color,
    String? emoji,
  }) {
    return DonutSegment(
      label: label ?? this.label,
      value: value ?? this.value,
      color: color ?? this.color,
      emoji: emoji ?? this.emoji,
    );
  }
}
