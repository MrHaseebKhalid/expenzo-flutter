import '../models/budget_model.dart';
import '../services/hive_service.dart';
import 'budget_repository.dart';

/// Hive implementation of BudgetRepository
class BudgetRepositoryImpl implements BudgetRepository {
  final HiveService _hiveService;

  BudgetRepositoryImpl(this._hiveService);

  @override
  Future<List<Budget>> getAllBudgets() async {
    final box = _hiveService.budgets;
    final budgets = <Budget>[];
    
    for (var i = 0; i < box.length; i++) {
      final json = box.getAt(i) as Map<String, dynamic>;
      budgets.add(Budget.fromJson(json));
    }
    
    return budgets;
  }

  @override
  Future<Budget?> getBudgetById(String id) async {
    final box = _hiveService.budgets;
    final json = box.get(id) as Map<String, dynamic>?;
    
    if (json == null) return null;
    
    return Budget.fromJson(json);
  }

  @override
  Future<Budget?> getBudgetByMonth(String month) async {
    final allBudgets = await getAllBudgets();
    
    try {
      return allBudgets.firstWhere((budget) => budget.month == month);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> addBudget(Budget budget) async {
    final box = _hiveService.budgets;
    await box.put(budget.id, budget.toJson());
  }

  @override
  Future<void> updateBudget(Budget budget) async {
    final box = _hiveService.budgets;
    await box.put(budget.id, budget.toJson());
  }

  @override
  Future<void> deleteBudget(String id) async {
    final box = _hiveService.budgets;
    await box.delete(id);
  }

  @override
  Future<void> clearAllBudgets() async {
    final box = _hiveService.budgets;
    await box.clear();
  }
}
