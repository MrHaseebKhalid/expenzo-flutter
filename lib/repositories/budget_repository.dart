import '../models/budget_model.dart';

/// Repository interface for Budget operations
abstract class BudgetRepository {
  /// Get all budgets
  Future<List<Budget>> getAllBudgets();

  /// Get budget by ID
  Future<Budget?> getBudgetById(String id);

  /// Get budget by month
  Future<Budget?> getBudgetByMonth(String month);

  /// Add a new budget
  Future<void> addBudget(Budget budget);

  /// Update an existing budget
  Future<void> updateBudget(Budget budget);

  /// Delete a budget
  Future<void> deleteBudget(String id);

  /// Clear all budgets
  Future<void> clearAllBudgets();
}
