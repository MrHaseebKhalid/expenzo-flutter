import 'package:flutter/foundation.dart';
import '../models/expense_model.dart';
import 'expense_service.dart';
import 'budget_service.dart';

/// Analytics Service
///
/// Handles analytics calculations and reporting
class AnalyticsService {
  static AnalyticsService? _instance;
  static AnalyticsService get instance => _instance ??= AnalyticsService._();

  AnalyticsService._();

  final ExpenseService _expenseService = ExpenseService.instance;
  final BudgetService _budgetService = BudgetService.instance;

  /// Calculate total expenses for a month
  double getTotalExpensesForMonth(int year, int month) {
    try {
      final expenses = _expenseService.getExpensesByMonth(year, month);
      return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
    } catch (e) {
      debugPrint('Failed to calculate total expenses for month: $e');
      return 0.0;
    }
  }

  /// Calculate total expenses by category for a month
  Map<ExpenseCategory, double> getExpensesByCategoryForMonth(
    int year,
    int month,
  ) {
    try {
      final expenses = _expenseService.getExpensesByMonth(year, month);
      final categoryTotals = <ExpenseCategory, double>{};

      for (final expense in expenses) {
        categoryTotals[expense.category] =
            (categoryTotals[expense.category] ?? 0.0) + expense.amount;
      }

      return categoryTotals;
    } catch (e) {
      debugPrint('Failed to calculate expenses by category for month: $e');
      return {};
    }
  }

  /// Calculate spending trend over months
  Map<String, double> getSpendingTrend(int year, int monthsCount) {
    try {
      final trend = <String, double>{};

      for (int i = 0; i < monthsCount; i++) {
        final month = DateTime.now().month - i;
        final adjustedMonth = month <= 0 ? month + 12 : month;
        final adjustedYear = month <= 0 ? year - 1 : year;

        final total = getTotalExpensesForMonth(adjustedYear, adjustedMonth);
        trend['$adjustedYear-$adjustedMonth'] = total;
      }

      return trend;
    } catch (e) {
      debugPrint('Failed to calculate spending trend: $e');
      return {};
    }
  }

  /// Calculate budget adherence for a month
  double getBudgetAdherenceForMonth(int year, int month) {
    try {
      final monthKey = '$year-${month.toString().padLeft(2, '0')}';
      final budget = _budgetService.getBudgetByMonth(monthKey);

      if (budget == null || budget.totalBudget == 0) {
        return 0.0;
      }

      final totalExpenses = getTotalExpensesForMonth(year, month);
      return (totalExpenses / budget.totalBudget) * 100;
    } catch (e) {
      debugPrint('Failed to calculate budget adherence: $e');
      return 0.0;
    }
  }

  /// Calculate category-wise spending breakdown
  List<Map<String, dynamic>> getCategorySpendingBreakdown(int year, int month) {
    try {
      final categoryTotals = getExpensesByCategoryForMonth(year, month);
      final totalExpenses = categoryTotals.values.fold(
        0.0,
        (sum, amount) => sum + amount,
      );

      final breakdown = <Map<String, dynamic>>[];

      for (final entry in categoryTotals.entries) {
        final percentage = totalExpenses > 0
            ? (entry.value / totalExpenses) * 100
            : 0.0;

        breakdown.add({
          'category': entry.key,
          'amount': entry.value,
          'percentage': percentage,
          'icon': entry.key.icon,
          'displayName': entry.key.displayName,
        });
      }

      // Sort by amount descending
      breakdown.sort(
        (a, b) => (b['amount'] as double).compareTo(a['amount'] as double),
      );

      return breakdown;
    } catch (e) {
      debugPrint('Failed to calculate category spending breakdown: $e');
      return [];
    }
  }

  /// Calculate monthly comparison
  Map<String, double> getMonthlyComparison(
    int year,
    int currentMonth,
    int previousMonth,
  ) {
    try {
      final currentMonthTotal = getTotalExpensesForMonth(year, currentMonth);
      final previousMonthTotal = getTotalExpensesForMonth(
        currentMonth == 1 ? year - 1 : year,
        currentMonth == 1 ? 12 : previousMonth,
      );

      final difference = currentMonthTotal - previousMonthTotal;
      final percentageChange = previousMonthTotal > 0
          ? (difference / previousMonthTotal) * 100
          : 0.0;

      return {
        'currentMonth': currentMonthTotal,
        'previousMonth': previousMonthTotal,
        'difference': difference,
        'percentageChange': percentageChange,
      };
    } catch (e) {
      debugPrint('Failed to calculate monthly comparison: $e');
      return {};
    }
  }

  /// Calculate financial health score (0-100)
  double calculateFinancialHealthScore(int year, int month) {
    try {
      double score = 100.0;

      // Budget adherence (40% of score)
      final budgetAdherence = getBudgetAdherenceForMonth(year, month);
      if (budgetAdherence > 100) {
        score -= 40;
      } else if (budgetAdherence > 80) {
        score -= 20;
      } else if (budgetAdherence > 60) {
        score -= 10;
      }

      // Spending consistency (30% of score)
      final trend = getSpendingTrend(year, 3);
      if (trend.length >= 2) {
        final values = trend.values.toList();
        final average = values.reduce((a, b) => a + b) / values.length;
        final currentMonth = values.first;

        if (currentMonth > average * 1.3) {
          score -= 30;
        } else if (currentMonth > average * 1.15) {
          score -= 15;
        }
      }

      // Category diversity (30% of score)
      final categoryBreakdown = getCategorySpendingBreakdown(year, month);
      if (categoryBreakdown.length < 3) {
        score -= 30;
      } else if (categoryBreakdown.length < 5) {
        score -= 15;
      }

      return score.clamp(0.0, 100.0);
    } catch (e) {
      debugPrint('Failed to calculate financial health score: $e');
      return 50.0;
    }
  }

  /// Get top spending categories
  List<Map<String, dynamic>> getTopSpendingCategories(
    int year,
    int month,
    int limit,
  ) {
    try {
      final breakdown = getCategorySpendingBreakdown(year, month);
      return breakdown.take(limit).toList();
    } catch (e) {
      debugPrint('Failed to get top spending categories: $e');
      return [];
    }
  }

  /// Calculate average daily spending for a month
  double getAverageDailySpending(int year, int month) {
    try {
      final totalExpenses = getTotalExpensesForMonth(year, month);
      final daysInMonth = DateTime(year, month + 1, 0).day;
      return totalExpenses / daysInMonth;
    } catch (e) {
      debugPrint('Failed to calculate average daily spending: $e');
      return 0.0;
    }
  }
}
