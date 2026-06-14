/// Immutable data model for an Expense.
class Expense {
  final String id;
  final ExpenseCategory category;
  final double amount;
  final DateTime date;
  final String? description;
  final double percentage;

  const Expense({
    required this.id,
    required this.category,
    required this.amount,
    required this.date,
    this.description,
    this.percentage = 0.0,
  });

  Expense copyWith({
    String? id,
    ExpenseCategory? category,
    double? amount,
    DateTime? date,
    String? description,
    double? percentage,
  }) {
    return Expense(
      id: id ?? this.id,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      description: description ?? this.description,
      percentage: percentage ?? this.percentage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category': category.name,
      'amount': amount,
      'date': date.toIso8601String(),
      'description': description,
      'percentage': percentage,
    };
  }

  factory Expense.fromJson(Map<String, dynamic> json) {
    return Expense(
      id: json['id'] as String,
      category: ExpenseCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => ExpenseCategory.others,
      ),
      amount: json['amount'] as double,
      date: DateTime.parse(json['date'] as String),
      description: json['description'] as String?,
      percentage: json['percentage'] as double? ?? 0.0,
    );
  }

  @override
  String toString() {
    return 'Expense(id: $id, category: $category, amount: $amount, date: $date, percentage: $percentage)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Expense &&
        other.id == id &&
        other.category == category &&
        other.amount == amount &&
        other.date == date &&
        other.description == description &&
        other.percentage == percentage;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        category.hashCode ^
        amount.hashCode ^
        date.hashCode ^
        description.hashCode ^
        percentage.hashCode;
  }
}

/// Category enum for expenses.
enum ExpenseCategory {
  food,
  transport,
  bills,
  shopping,
  health,
  entertainment,
  others,
}

extension ExpenseCategoryExtension on ExpenseCategory {
  String get displayName {
    switch (this) {
      case ExpenseCategory.food:
        return 'Food';
      case ExpenseCategory.transport:
        return 'Transport';
      case ExpenseCategory.bills:
        return 'Bills';
      case ExpenseCategory.shopping:
        return 'Shopping';
      case ExpenseCategory.health:
        return 'Health';
      case ExpenseCategory.entertainment:
        return 'Entertainment';
      case ExpenseCategory.others:
        return 'Others';
    }
  }

  String get icon {
    switch (this) {
      case ExpenseCategory.food:
        return '🍔';
      case ExpenseCategory.transport:
        return '🚗';
      case ExpenseCategory.bills:
        return '📄';
      case ExpenseCategory.shopping:
        return '🛍️';
      case ExpenseCategory.health:
        return '🏥';
      case ExpenseCategory.entertainment:
        return '🎮';
      case ExpenseCategory.others:
        return '📦';
    }
  }
}
