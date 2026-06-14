/// Immutable data model for a Budget.
class Budget {
  final String id;
  final String month;
  final double totalBudget;
  final double totalExpenses;
  final List<BudgetCategory> categories;

  const Budget({
    required this.id,
    required this.month,
    required this.totalBudget,
    required this.totalExpenses,
    required this.categories,
  });

  double get remainingBudget => totalBudget - totalExpenses;

  double get budgetPercentage => totalBudget > 0 ? (totalExpenses / totalBudget) * 100 : 0;

  Budget copyWith({
    String? id,
    String? month,
    double? totalBudget,
    double? totalExpenses,
    List<BudgetCategory>? categories,
  }) {
    return Budget(
      id: id ?? this.id,
      month: month ?? this.month,
      totalBudget: totalBudget ?? this.totalBudget,
      totalExpenses: totalExpenses ?? this.totalExpenses,
      categories: categories ?? this.categories,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'month': month,
      'totalBudget': totalBudget,
      'totalExpenses': totalExpenses,
      'categories': categories.map((e) => e.toJson()).toList(),
    };
  }

  factory Budget.fromJson(Map<String, dynamic> json) {
    return Budget(
      id: json['id'] as String,
      month: json['month'] as String,
      totalBudget: json['totalBudget'] as double,
      totalExpenses: json['totalExpenses'] as double,
      categories: (json['categories'] as List<dynamic>)
          .map((e) => BudgetCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'Budget(id: $id, month: $month, totalBudget: $totalBudget, totalExpenses: $totalExpenses, categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Budget &&
        other.id == id &&
        other.month == month &&
        other.totalBudget == totalBudget &&
        other.totalExpenses == totalExpenses;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        month.hashCode ^
        totalBudget.hashCode ^
        totalExpenses.hashCode;
  }
}

/// Immutable data model for a Budget Category.
class BudgetCategory {
  final String name;
  final double amount;
  final int color;
  final String icon;

  const BudgetCategory({
    required this.name,
    required this.amount,
    required this.color,
    required this.icon,
  });

  BudgetCategory copyWith({
    String? name,
    double? amount,
    int? color,
    String? icon,
  }) {
    return BudgetCategory(
      name: name ?? this.name,
      amount: amount ?? this.amount,
      color: color ?? this.color,
      icon: icon ?? this.icon,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'color': color,
      'icon': icon,
    };
  }

  factory BudgetCategory.fromJson(Map<String, dynamic> json) {
    return BudgetCategory(
      name: json['name'] as String,
      amount: json['amount'] as double,
      color: json['color'] as int,
      icon: json['icon'] as String,
    );
  }

  @override
  String toString() {
    return 'BudgetCategory(name: $name, amount: $amount, color: $color, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BudgetCategory &&
        other.name == name &&
        other.amount == amount &&
        other.color == color &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return name.hashCode ^ amount.hashCode ^ color.hashCode ^ icon.hashCode;
  }
}
