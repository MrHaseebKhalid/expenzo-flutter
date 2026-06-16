import '../models/transaction_model.dart';
import '../services/hive_service.dart';
import 'transaction_repository.dart';

/// Hive implementation of TransactionRepository
class TransactionRepositoryImpl implements TransactionRepository {
  final HiveService _hiveService;

  TransactionRepositoryImpl(this._hiveService);

  @override
  Future<List<Transaction>> getAllTransactions() async {
    final box = _hiveService.transactions;
    final transactions = <Transaction>[];
    
    for (var i = 0; i < box.length; i++) {
      final json = box.getAt(i) as Map<String, dynamic>;
      transactions.add(Transaction.fromJson(json));
    }
    
    return transactions;
  }

  @override
  Future<Transaction?> getTransactionById(String id) async {
    final box = _hiveService.transactions;
    final json = box.get(id) as Map<String, dynamic>?;
    
    if (json == null) return null;
    
    return Transaction.fromJson(json);
  }

  @override
  Future<void> addTransaction(Transaction transaction) async {
    final box = _hiveService.transactions;
    await box.put(transaction.id, transaction.toJson());
  }

  @override
  Future<void> updateTransaction(Transaction transaction) async {
    final box = _hiveService.transactions;
    await box.put(transaction.id, transaction.toJson());
  }

  @override
  Future<void> deleteTransaction(String id) async {
    final box = _hiveService.transactions;
    await box.delete(id);
  }

  @override
  Future<List<Transaction>> getTransactionsByDateRange(DateTime start, DateTime end) async {
    final allTransactions = await getAllTransactions();
    
    return allTransactions.where((transaction) {
      return transaction.date.isAfter(start) && transaction.date.isBefore(end);
    }).toList();
  }

  @override
  Future<void> clearAllTransactions() async {
    final box = _hiveService.transactions;
    await box.clear();
  }
}
