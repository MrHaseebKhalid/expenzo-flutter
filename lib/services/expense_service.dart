import 'package:flutter/foundation.dart';
import '../models/adapters/expense_adapter.dart';
import '../models/expense_model.dart';
import 'hive_service.dart';

/// Expense Service
///
/// Handles expense business logic with Hive local storage
class ExpenseService {
  static ExpenseService? _instance;
  static ExpenseService get instance => _instance ??= ExpenseService._();

  ExpenseService._();

  final HiveService _hiveService = HiveService.instance;

  /// Add a new expense
  Future<void> addExpense(Expense expense) async {
    try {
      final box = _hiveService.expenses;
      final hiveExpense = HiveExpense.fromExpense(expense);
      await box.put(expense.id, hiveExpense);
      debugPrint('Expense added: ${expense.id}');
    } catch (e) {
      debugPrint('Failed to add expense: $e');
      rethrow;
    }
  }

  /// Update an existing expense
  Future<void> updateExpense(Expense expense) async {
    try {
      final box = _hiveService.expenses;
      final hiveExpense = HiveExpense.fromExpense(expense);
      await box.put(expense.id, hiveExpense);
      debugPrint('Expense updated: ${expense.id}');
    } catch (e) {
      debugPrint('Failed to update expense: $e');
      rethrow;
    }
  }

  /// Delete an expense
  Future<void> deleteExpense(String expenseId) async {
    try {
      final box = _hiveService.expenses;
      await box.delete(expenseId);
      debugPrint('Expense deleted: $expenseId');
    } catch (e) {
      debugPrint('Failed to delete expense: $e');
      rethrow;
    }
  }

  /// Get an expense by ID
  Expense? getExpense(String expenseId) {
    try {
      final box = _hiveService.expenses;
      final hiveExpense = box.get(expenseId);
      if (hiveExpense == null) return null;
      return hiveExpense.toExpense();
    } catch (e) {
      debugPrint('Failed to get expense: $e');
      return null;
    }
  }

  /// Get all expenses
  List<Expense> getAllExpenses() {
    try {
      final box = _hiveService.expenses;
      return box.values
          .cast<HiveExpense>()
          .map((hiveExpense) => hiveExpense.toExpense())
          .toList();
    } catch (e) {
      debugPrint('Failed to get all expenses: $e');
      return [];
    }
  }

  /// Get expenses by category
  List<Expense> getExpensesByCategory(ExpenseCategory category) {
    try {
      final box = _hiveService.expenses;
      return box.values
          .cast<HiveExpense>()
          .map((hiveExpense) => hiveExpense.toExpense())
          .where((expense) => expense.category == category)
          .toList();
    } catch (e) {
      debugPrint('Failed to get expenses by category: $e');
      return [];
    }
  }

  /// Get expenses by date range
  List<Expense> getExpensesByDateRange(DateTime startDate, DateTime endDate) {
    try {
      final box = _hiveService.expenses;
      return box.values
          .cast<HiveExpense>()
          .map((hiveExpense) => hiveExpense.toExpense())
          .where(
            (expense) =>
                expense.date.isAfter(startDate) &&
                expense.date.isBefore(endDate),
          )
          .toList();
    } catch (e) {
      debugPrint('Failed to get expenses by date range: $e');
      return [];
    }
  }

  /// Get expenses by month
  List<Expense> getExpensesByMonth(int year, int month) {
    try {
      final startDate = DateTime(year, month, 1);
      final endDate = DateTime(year, month + 1, 1);
      return getExpensesByDateRange(startDate, endDate);
    } catch (e) {
      debugPrint('Failed to get expenses by month: $e');
      return [];
    }
  }

  /// Get total expenses by category
  double getTotalExpensesByCategory(ExpenseCategory category) {
    try {
      final expenses = getExpensesByCategory(category);
      return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
    } catch (e) {
      debugPrint('Failed to get total expenses by category: $e');
      return 0.0;
    }
  }

  /// Get total expenses for a date range
  double getTotalExpensesByDateRange(DateTime startDate, DateTime endDate) {
    try {
      final expenses = getExpensesByDateRange(startDate, endDate);
      return expenses.fold(0.0, (sum, expense) => sum + expense.amount);
    } catch (e) {
      debugPrint('Failed to get total expenses by date range: $e');
      return 0.0;
    }
  }

  /// Search expenses by description
  List<Expense> searchExpenses(String query) {
    try {
      final box = _hiveService.expenses;
      final lowerQuery = query.toLowerCase();
      return box.values
          .cast<HiveExpense>()
          .map((hiveExpense) => hiveExpense.toExpense())
          .where(
            (expense) =>
                expense.description?.toLowerCase().contains(lowerQuery) ??
                false,
          )
          .toList();
    } catch (e) {
      debugPrint('Failed to search expenses: $e');
      return [];
    }
  }

  /// Clear all expenses
  Future<void> clearAllExpenses() async {
    try {
      final box = _hiveService.expenses;
      await box.clear();
      debugPrint('All expenses cleared');
    } catch (e) {
      debugPrint('Failed to clear all expenses: $e');
      rethrow;
    }
  }
}
