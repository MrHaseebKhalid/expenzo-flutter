import '../models/expense_model.dart';

/// Repository interface for Expense operations
abstract class ExpenseRepository {
  /// Get all expenses
  Future<List<Expense>> getAllExpenses();

  /// Get expense by ID
  Future<Expense?> getExpenseById(String id);

  /// Add a new expense
  Future<void> addExpense(Expense expense);

  /// Update an existing expense
  Future<void> updateExpense(Expense expense);

  /// Delete an expense
  Future<void> deleteExpense(String id);

  /// Get expenses by date range
  Future<List<Expense>> getExpensesByDateRange(DateTime start, DateTime end);

  /// Get expenses by category
  Future<List<Expense>> getExpensesByCategory(ExpenseCategory category);

  /// Clear all expenses
  Future<void> clearAllExpenses();
}
