import 'package:flutter/foundation.dart';
import '../models/adapters/transaction_adapter.dart';
import '../models/transaction_model.dart';
import 'hive_service.dart';

/// Transaction Service
///
/// Handles transaction business logic with Hive local storage
class TransactionService {
  static TransactionService? _instance;
  static TransactionService get instance => _instance ??= TransactionService._();

  TransactionService._();

  final HiveService _hiveService = HiveService.instance;

  /// Add a new transaction
  Future<void> addTransaction(Transaction transaction) async {
    try {
      final box = _hiveService.transactions;
      final hiveTransaction = HiveTransaction.fromTransaction(transaction);
      await box.put(transaction.id, hiveTransaction);
      debugPrint('Transaction added: ${transaction.id}');
    } catch (e) {
      debugPrint('Failed to add transaction: $e');
      rethrow;
    }
  }

  /// Update an existing transaction
  Future<void> updateTransaction(Transaction transaction) async {
    try {
      final box = _hiveService.transactions;
      final hiveTransaction = HiveTransaction.fromTransaction(transaction);
      await box.put(transaction.id, hiveTransaction);
      debugPrint('Transaction updated: ${transaction.id}');
    } catch (e) {
      debugPrint('Failed to update transaction: $e');
      rethrow;
    }
  }

  /// Delete a transaction
  Future<void> deleteTransaction(String transactionId) async {
    try {
      final box = _hiveService.transactions;
      await box.delete(transactionId);
      debugPrint('Transaction deleted: $transactionId');
    } catch (e) {
      debugPrint('Failed to delete transaction: $e');
      rethrow;
    }
  }

  /// Get a transaction by ID
  Transaction? getTransaction(String transactionId) {
    try {
      final box = _hiveService.transactions;
      final hiveTransaction = box.get(transactionId);
      if (hiveTransaction == null) return null;
      return hiveTransaction.toTransaction();
    } catch (e) {
      debugPrint('Failed to get transaction: $e');
      return null;
    }
  }

  /// Get all transactions
  List<Transaction> getAllTransactions() {
    try {
      final box = _hiveService.transactions;
      return box.values.cast<HiveTransaction>().map((hiveTransaction) => hiveTransaction.toTransaction()).toList();
    } catch (e) {
      debugPrint('Failed to get all transactions: $e');
      return [];
    }
  }

  /// Get transactions by category
  List<Transaction> getTransactionsByCategory(String category) {
    try {
      final box = _hiveService.transactions;
      return box.values
          .cast<HiveTransaction>()
          .map((hiveTransaction) => hiveTransaction.toTransaction())
          .where((transaction) => transaction.category == category)
          .toList();
    } catch (e) {
      debugPrint('Failed to get transactions by category: $e');
      return [];
    }
  }

  /// Get transactions by date range
  List<Transaction> getTransactionsByDateRange(DateTime startDate, DateTime endDate) {
    try {
      final box = _hiveService.transactions;
      return box.values
          .cast<HiveTransaction>()
          .map((hiveTransaction) => hiveTransaction.toTransaction())
          .where((transaction) =>
              transaction.date.isAfter(startDate) &&
              transaction.date.isBefore(endDate))
          .toList();
    } catch (e) {
      debugPrint('Failed to get transactions by date range: $e');
      return [];
    }
  }

  /// Get transactions by month
  List<Transaction> getTransactionsByMonth(int year, int month) {
    try {
      final startDate = DateTime(year, month, 1);
      final endDate = DateTime(year, month + 1, 1);
      return getTransactionsByDateRange(startDate, endDate);
    } catch (e) {
      debugPrint('Failed to get transactions by month: $e');
      return [];
    }
  }

  /// Get transactions by status
  List<Transaction> getTransactionsByStatus(TransactionStatus status) {
    try {
      final box = _hiveService.transactions;
      return box.values
          .cast<HiveTransaction>()
          .map((hiveTransaction) => hiveTransaction.toTransaction())
          .where((transaction) => transaction.status == status)
          .toList();
    } catch (e) {
      debugPrint('Failed to get transactions by status: $e');
      return [];
    }
  }

  /// Search transactions by title or description
  List<Transaction> searchTransactions(String query) {
    try {
      final box = _hiveService.transactions;
      final lowerQuery = query.toLowerCase();
      return box.values
          .cast<HiveTransaction>()
          .map((hiveTransaction) => hiveTransaction.toTransaction())
          .where((transaction) =>
              transaction.title.toLowerCase().contains(lowerQuery) ||
              (transaction.description?.toLowerCase().contains(lowerQuery) ?? false))
          .toList();
    } catch (e) {
      debugPrint('Failed to search transactions: $e');
      return [];
    }
  }

  /// Get total amount by category
  double getTotalAmountByCategory(String category) {
    try {
      final transactions = getTransactionsByCategory(category);
      return transactions.fold(0.0, (sum, transaction) => sum + transaction.amount);
    } catch (e) {
      debugPrint('Failed to get total amount by category: $e');
      return 0.0;
    }
  }

  /// Get total amount for date range
  double getTotalAmountByDateRange(DateTime startDate, DateTime endDate) {
    try {
      final transactions = getTransactionsByDateRange(startDate, endDate);
      return transactions.fold(0.0, (sum, transaction) => sum + transaction.amount);
    } catch (e) {
      debugPrint('Failed to get total amount by date range: $e');
      return 0.0;
    }
  }

  /// Clear all transactions
  Future<void> clearAllTransactions() async {
    try {
      final box = _hiveService.transactions;
      await box.clear();
      debugPrint('All transactions cleared');
    } catch (e) {
      debugPrint('Failed to clear all transactions: $e');
      rethrow;
    }
  }
}
