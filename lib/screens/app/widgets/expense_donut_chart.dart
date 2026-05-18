import 'dart:math' as math;

import 'package:expenzo/screens/app/widgets/donut_chart_config.dart';
import 'package:expenzo/screens/app/widgets/donut_segment.dart';
import 'package:expenzo/screens/app/widgets/expense_donut_chart_painter.dart';
import 'package:flutter/material.dart';

/// Production-grade donut chart with load, value-change, and pulse animations.
class ExpenseDonutChart extends StatefulWidget {
  const ExpenseDonutChart({
    super.key,
    required this.segments,
    this.config = const DonutChartConfig(),
    this.size = 260.0,
  });

  final List<DonutSegment> segments;
  final DonutChartConfig config;
  final double size;

  @override
  State<ExpenseDonutChart> createState() => _ExpenseDonutChartState();
}

class _ExpenseDonutChartState extends State<ExpenseDonutChart>
    with TickerProviderStateMixin {
  late AnimationController _loadController;
  late AnimationController _valueController;
  late AnimationController _pulseController;

  late Animation<double> _loadAnimation;
  late Animation<double> _pulseAnimation;

  List<double> _targetSweepsRadians = [];
  List<double> _fromSweepsRadians = [];
  List<double> _startAnglesRadians = [];
  List<double> _percentages = [];

  // ── Tracks whether load animation has fully completed ──────────────────
  bool _loadComplete = false;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _recomputeGeometry(widget.segments);
    // Start from zero sweeps for the load sweep-in animation
    _fromSweepsRadians = List<double>.filled(_targetSweepsRadians.length, 0.0);
    _loadController.forward();
  }

  @override
  void didUpdateWidget(covariant ExpenseDonutChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.config.animationDuration != widget.config.animationDuration) {
      _loadController.duration = widget.config.loadDuration;
    }
    if (oldWidget.config.valueChangeAnimationDuration !=
        widget.config.valueChangeAnimationDuration) {
      _valueController.duration = widget.config.valueChangeDuration;
    }
    if (oldWidget.config.pulseAnimationDuration !=
        widget.config.pulseAnimationDuration) {
      _pulseController.duration = widget.config.pulseDuration;
    }
    if (!_segmentsEqual(oldWidget.segments, widget.segments)) {
      _onSegmentsChanged();
    }
  }

  void _initAnimations() {
    _loadController = AnimationController(
      vsync: this,
      duration: widget.config.loadDuration,
    );
    _valueController = AnimationController(
      vsync: this,
      duration: widget.config.valueChangeDuration,
    );
    _pulseController = AnimationController(
      vsync: this,
      duration: widget.config.pulseDuration,
    );

    _loadAnimation = CurvedAnimation(
      parent: _loadController,
      curve: widget.config.loadAnimationCurve,
    );

    _pulseAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.0,
          end: widget.config.pulseScalePeak,
        ),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: widget.config.pulseScalePeak,
          end: 1.0,
        ),
        weight: 50,
      ),
    ]).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _loadController.addStatusListener(_onLoadStatus);
  }

  // ── Called when the load animation fully completes ─────────────────────
  void _onLoadStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed && !_loadComplete) {
      setState(() {
        _loadComplete = true;
        // ✅ FIX: Snap from-sweeps to current targets so chart stays visible
        _fromSweepsRadians = List<double>.from(_targetSweepsRadians);
      });
      _pulseController.forward(from: 0);
    }
  }

  void _onSegmentsChanged() {
    // Capture the currently visible sweeps as the animation start point
    final currentSweeps = List<double>.from(_targetSweepsRadians);
    _recomputeGeometry(widget.segments);
    _fromSweepsRadians = _resizeList(currentSweeps, _targetSweepsRadians.length);
    _valueController.forward(from: 0);
  }

  void _recomputeGeometry(List<DonutSegment> segments) {
    final total = segments.fold<double>(0, (sum, s) => sum + s.value);
    final fullCircle = 2 * math.pi;
    final offset = widget.config.startAngleOffsetRadians;

    _startAnglesRadians = [];
    _targetSweepsRadians = [];
    _percentages = [];

    var cursor = offset;
    for (final segment in segments) {
      _startAnglesRadians.add(cursor);
      final fraction = total > 0 ? segment.value / total : 0.0;
      final sweep = fraction * fullCircle;
      _targetSweepsRadians.add(sweep);
      _percentages.add(fraction * 100);
      cursor += sweep;
    }
  }

  // ── ✅ FIXED: Separate load phase from value-change phase ───────────────
  List<double> _currentAnimatedSweeps() {
    final result = <double>[];

    for (var i = 0; i < _targetSweepsRadians.length; i++) {
      final to = _targetSweepsRadians[i];

      if (!_loadComplete) {
        // LOAD PHASE: sweep each segment from 0 → target, scaled by loadT
        // loadAnimation.value goes 0→1, so segments grow in smoothly
        result.add(to * _loadAnimation.value);
      } else {
        // VALUE CHANGE PHASE: interpolate from old → new targets
        final from =
            i < _fromSweepsRadians.length ? _fromSweepsRadians[i] : to;
        final t = widget.config.valueChangeAnimationCurve
            .transform(_valueController.value);
        result.add(_lerp(from, to, t));
      }
    }
    return result;
  }

  double _lerp(double a, double b, double t) => a + (b - a) * t;

  List<double> _resizeList(List<double> source, int length) {
    if (source.length == length) return List<double>.from(source);
    final result = List<double>.filled(length, 0.0);
    for (var i = 0; i < length && i < source.length; i++) {
      result[i] = source[i];
    }
    return result;
  }

  bool _segmentsEqual(List<DonutSegment> a, List<DonutSegment> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i].value != b[i].value ||
          a[i].label != b[i].label ||
          a[i].color != b[i].color) {
        return false;
      }
    }
    return true;
  }

  @override
  void dispose() {
    _loadController.removeStatusListener(_onLoadStatus);
    _loadController.dispose();
    _valueController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      // AnimatedBuilder listens to all 3 controllers — no setState needed
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _loadController,
          _valueController,
          _pulseController,
        ]),
        builder: (context, _) {
          final scale = _loadComplete ? _pulseAnimation.value : 1.0;
          return Transform.scale(
            scale: scale,
            child: CustomPaint(
              size: Size.square(widget.size),
              painter: ExpenseDonutChartPainter(
                segments: widget.segments,
                config: widget.config,
                animatedSweepsRadians: _currentAnimatedSweeps(),
                startAnglesRadians: _startAnglesRadians,
                percentages: _percentages,
              ),
            ),
          );
        },
      ),
    );
  }
}