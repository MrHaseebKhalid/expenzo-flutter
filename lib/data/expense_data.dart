import 'package:expenzo/screens/main_app/home/widgets/donut_chart/donut_segment.dart';
import 'package:flutter/material.dart';

/// Provides expense segments for charts and summaries.
///
/// Swap this implementation later (Firebase stream, Hive, etc.) without
/// changing [ExpenseDonutChart] or the overview screen.
abstract class ExpenseDataRepository {
  List<DonutSegment> get overviewDonutSegments;
}

/// Static hardcoded data — replace [ExpenseDataRepository] binding in one place.
class StaticExpenseDataRepository implements ExpenseDataRepository {
  const StaticExpenseDataRepository();

  static const StaticExpenseDataRepository instance =
      StaticExpenseDataRepository();

  static const List<DonutSegment> _overviewSegments = [
    DonutSegment(
      label: 'Food',
      value: 3400,
      color: Color(0xFF4361EE),
      emoji: '🍔',
    ),
    DonutSegment(
      label: 'Transport',
      value: 2700,
      color: Color(0xFFF4A261),
      emoji: '🚗',
    ),
    DonutSegment(
      label: 'Bills',
      value: 3000,
      color: Color(0xFF9B5DE5),
      emoji: '📄',
    ),
    DonutSegment(
      label: 'Shopping',
      value: 1500,
      color: Color(0xFFF72585),
      emoji: '🛍️',
    ),
    DonutSegment(
      label: 'Health',
      value: 2000,
      color: Color(0xFF00B4D8),
      emoji: '💊',
    ),
    DonutSegment(
      label: 'Entertainment',
      value: 2500,
      color: Color(0xFFC77DFF),
      emoji: '🎬',
    ),
    DonutSegment(
      label: 'Others',
      value: 1000,
      color: Color(0xFF2EC4B6),
      emoji: '📦',
    ),
  ];

  @override
  List<DonutSegment> get overviewDonutSegments =>
      List<DonutSegment>.unmodifiable(_overviewSegments);
}

/// App-wide accessor — point this at a stream-backed repository when ready.
ExpenseDataRepository get expenseDataRepository =>
    StaticExpenseDataRepository.instance;
