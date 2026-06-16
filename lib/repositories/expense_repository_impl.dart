import '../models/expense_model.dart';
import '../services/hive_service.dart';
import 'expense_repository.dart';

/// Hive implementation of ExpenseRepository
class ExpenseRepositoryImpl implements ExpenseRepository {
  final HiveService _hiveService;

  ExpenseRepositoryImpl(this._hiveService);

  @override
  Future<List<Expense>> getAllExpenses() async {
    final box = _hiveService.expenses;
    final expenses = <Expense>[];
    
    for (var i = 0; i < box.length; i++) {
      final json = box.getAt(i) as Map<String, dynamic>;
      expenses.add(Expense.fromJson(json));
    }
    
    return expenses;
  }

  @override
  Future<Expense?> getExpenseById(String id) async {
    final box = _hiveService.expenses;
    final json = box.get(id) as Map<String, dynamic>?;
    
    if (json == null) return null;
    
    return Expense.fromJson(json);
  }

  @override
  Future<void> addExpense(Expense expense) async {
    final box = _hiveService.expenses;
    await box.put(expense.id, expense.toJson());
  }

  @override
  Future<void> updateExpense(Expense expense) async {
    final box = _hiveService.expenses;
    await box.put(expense.id, expense.toJson());
  }

  @override
  Future<void> deleteExpense(String id) async {
    final box = _hiveService.expenses;
    await box.delete(id);
  }

  @override
  Future<List<Expense>> getExpensesByDateRange(DateTime start, DateTime end) async {
    final allExpenses = await getAllExpenses();
    
    return allExpenses.where((expense) {
      return expense.date.isAfter(start) && expense.date.isBefore(end);
    }).toList();
  }

  @override
  Future<List<Expense>> getExpensesByCategory(ExpenseCategory category) async {
    final allExpenses = await getAllExpenses();
    
    return allExpenses.where((expense) {
      return expense.category == category;
    }).toList();
  }

  @override
  Future<void> clearAllExpenses() async {
    final box = _hiveService.expenses;
    await box.clear();
  }
}
