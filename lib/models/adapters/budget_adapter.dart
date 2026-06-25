import 'package:hive/hive.dart';
import '../budget_model.dart';

part 'budget_adapter.g.dart';

@HiveType(typeId: 1)
class HiveBudget {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String month;
  
  @HiveField(2)
  final double totalBudget;
  
  @HiveField(3)
  final double totalExpenses;
  
  @HiveField(4)
  final List<HiveBudgetCategory> categories;

  HiveBudget({
    required this.id,
    required this.month,
    required this.totalBudget,
    required this.totalExpenses,
    required this.categories,
  });

  Budget toBudget() {
    return Budget(
      id: id,
      month: month,
      totalBudget: totalBudget,
      totalExpenses: totalExpenses,
      categories: categories.map((e) => e.toBudgetCategory()).toList(),
    );
  }

  factory HiveBudget.fromBudget(Budget budget) {
    return HiveBudget(
      id: budget.id,
      month: budget.month,
      totalBudget: budget.totalBudget,
      totalExpenses: budget.totalExpenses,
      categories: budget.categories.map((e) => HiveBudgetCategory.fromBudgetCategory(e)).toList(),
    );
  }
}

@HiveType(typeId: 2)
class HiveBudgetCategory {
  @HiveField(0)
  final String name;
  
  @HiveField(1)
  final double amount;
  
  @HiveField(2)
  final int color;
  
  @HiveField(3)
  final String icon;

  HiveBudgetCategory({
    required this.name,
    required this.amount,
    required this.color,
    required this.icon,
  });

  BudgetCategory toBudgetCategory() {
    return BudgetCategory(
      name: name,
      amount: amount,
      color: color,
      icon: icon,
    );
  }

  factory HiveBudgetCategory.fromBudgetCategory(BudgetCategory category) {
    return HiveBudgetCategory(
      name: category.name,
      amount: category.amount,
      color: category.color,
      icon: category.icon,
    );
  }
}
