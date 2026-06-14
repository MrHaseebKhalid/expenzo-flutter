/// Immutable data model for Monthly Comparison data.
class MonthlyComparison {
  final String id;
  final String month;
  final double income;
  final double expenses;
  final double budget;
  final double savings;

  const MonthlyComparison({
    required this.id,
    required this.month,
    required this.income,
    required this.expenses,
    required this.budget,
    required this.savings,
  });

  double get budgetUsagePercentage => budget > 0 ? (expenses / budget) * 100 : 0;

  double get savingsPercentage => income > 0 ? (savings / income) * 100 : 0;

  MonthlyComparison copyWith({
    String? id,
    String? month,
    double? income,
    double? expenses,
    double? budget,
    double? savings,
  }) {
    return MonthlyComparison(
      id: id ?? this.id,
      month: month ?? this.month,
      income: income ?? this.income,
      expenses: expenses ?? this.expenses,
      budget: budget ?? this.budget,
      savings: savings ?? this.savings,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'month': month,
      'income': income,
      'expenses': expenses,
      'budget': budget,
      'savings': savings,
    };
  }

  factory MonthlyComparison.fromJson(Map<String, dynamic> json) {
    return MonthlyComparison(
      id: json['id'] as String,
      month: json['month'] as String,
      income: json['income'] as double,
      expenses: json['expenses'] as double,
      budget: json['budget'] as double,
      savings: json['savings'] as double,
    );
  }

  @override
  String toString() {
    return 'MonthlyComparison(id: $id, month: $month, income: $income, expenses: $expenses, budget: $budget, savings: $savings)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MonthlyComparison &&
        other.id == id &&
        other.month == month &&
        other.income == income &&
        other.expenses == expenses &&
        other.budget == budget &&
        other.savings == savings;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        month.hashCode ^
        income.hashCode ^
        expenses.hashCode ^
        budget.hashCode ^
        savings.hashCode;
  }
}
