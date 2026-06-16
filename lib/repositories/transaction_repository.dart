import '../models/transaction_model.dart';

/// Repository interface for Transaction operations
abstract class TransactionRepository {
  /// Get all transactions
  Future<List<Transaction>> getAllTransactions();

  /// Get transaction by ID
  Future<Transaction?> getTransactionById(String id);

  /// Add a new transaction
  Future<void> addTransaction(Transaction transaction);

  /// Update an existing transaction
  Future<void> updateTransaction(Transaction transaction);

  /// Delete a transaction
  Future<void> deleteTransaction(String id);

  /// Get transactions by date range
  Future<List<Transaction>> getTransactionsByDateRange(DateTime start, DateTime end);

  /// Clear all transactions
  Future<void> clearAllTransactions();
}
