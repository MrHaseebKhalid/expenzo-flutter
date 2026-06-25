import 'package:hive/hive.dart';
import '../expense_model.dart';

part 'expense_adapter.g.dart';

@HiveType(typeId: 0)
class HiveExpense {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String category;
  
  @HiveField(2)
  final double amount;
  
  @HiveField(3)
  final DateTime date;
  
  @HiveField(4)
  final String? description;
  
  @HiveField(5)
  final double percentage;

  HiveExpense({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    this.description,
    this.percentage = 0.0,
  });

  Expense toExpense() {
    return Expense(
      id: id,
      category: ExpenseCategory.values.firstWhere(
        (e) => e.name == category,
        orElse: () => ExpenseCategory.others,
      ),
      amount: amount,
      date: date,
      description: description,
      percentage: percentage,
    );
  }

  factory HiveExpense.fromExpense(Expense expense) {
    return HiveExpense(
      id: expense.id,
      category: expense.category.name,
      amount: expense.amount,
      date: expense.date,
      description: expense.description,
      percentage: expense.percentage,
    );
  }
}
