import 'package:flutter/foundation.dart';
import '../models/adapters/budget_adapter.dart';
import '../models/budget_model.dart';
import 'hive_service.dart';

/// Budget Service
///
/// Handles budget business logic with Hive local storage
class BudgetService {
  static BudgetService? _instance;
  static BudgetService get instance => _instance ??= BudgetService._();

  BudgetService._();

  final HiveService _hiveService = HiveService.instance;

  /// Add a new budget
  Future<void> addBudget(Budget budget) async {
    try {
      final box = _hiveService.budgets;
      final hiveBudget = HiveBudget.fromBudget(budget);
      await box.put(budget.id, hiveBudget);
      debugPrint('Budget added: ${budget.id}');
    } catch (e) {
      debugPrint('Failed to add budget: $e');
      rethrow;
    }
  }

  /// Update an existing budget
  Future<void> updateBudget(Budget budget) async {
    try {
      final box = _hiveService.budgets;
      final hiveBudget = HiveBudget.fromBudget(budget);
      await box.put(budget.id, hiveBudget);
      debugPrint('Budget updated: ${budget.id}');
    } catch (e) {
      debugPrint('Failed to update budget: $e');
      rethrow;
    }
  }

  /// Delete a budget
  Future<void> deleteBudget(String budgetId) async {
    try {
      final box = _hiveService.budgets;
      await box.delete(budgetId);
      debugPrint('Budget deleted: $budgetId');
    } catch (e) {
      debugPrint('Failed to delete budget: $e');
      rethrow;
    }
  }

  /// Get a budget by ID
  Budget? getBudget(String budgetId) {
    try {
      final box = _hiveService.budgets;
      final hiveBudget = box.get(budgetId);
      if (hiveBudget == null) return null;
      return hiveBudget.toBudget();
    } catch (e) {
      debugPrint('Failed to get budget: $e');
      return null;
    }
  }

  /// Get all budgets
  List<Budget> getAllBudgets() {
    try {
      final box = _hiveService.budgets;
      return box.values.cast<HiveBudget>().map((hiveBudget) => hiveBudget.toBudget()).toList();
    } catch (e) {
      debugPrint('Failed to get all budgets: $e');
      return [];
    }
  }

  /// Get budget by month
  Budget? getBudgetByMonth(String month) {
    try {
      final budgets = getAllBudgets();
      return budgets.firstWhere(
        (budget) => budget.month == month,
        orElse: () => budgets.isEmpty ? Budget(
          id: '',
          month: month,
          totalBudget: 0,
          totalExpenses: 0,
          categories: [],
        ) : budgets.first,
      );
    } catch (e) {
      debugPrint('Failed to get budget by month: $e');
      return null;
    }
  }

  /// Update budget expenses
  Future<void> updateBudgetExpenses(String budgetId, double newTotalExpenses) async {
    try {
      final budget = getBudget(budgetId);
      if (budget != null) {
        final updatedBudget = budget.copyWith(totalExpenses: newTotalExpenses);
        await updateBudget(updatedBudget);
      }
    } catch (e) {
      debugPrint('Failed to update budget expenses: $e');
      rethrow;
    }
  }

  /// Get budget category by name
  BudgetCategory? getBudgetCategory(String budgetId, String categoryName) {
    try {
      final budget = getBudget(budgetId);
      if (budget == null) return null;
      return budget.categories.firstWhere(
        (category) => category.name == categoryName,
        orElse: () => budget.categories.isEmpty ? BudgetCategory(
          name: '',
          amount: 0,
          color: 0,
          icon: '',
        ) : budget.categories.first,
      );
    } catch (e) {
      debugPrint('Failed to get budget category: $e');
      return null;
    }
  }

  /// Clear all budgets
  Future<void> clearAllBudgets() async {
    try {
      final box = _hiveService.budgets;
      await box.clear();
      debugPrint('All budgets cleared');
    } catch (e) {
      debugPrint('Failed to clear all budgets: $e');
      rethrow;
    }
  }
}
