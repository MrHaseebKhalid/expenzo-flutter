/// Immutable data model for Analytics Insights.
class Analytics {
  final String id;
  final String period;
  final double totalIncome;
  final double totalExpenses;
  final double savingsRate;
  final SpendingTrend spendingTrend;
  final List<CategoryBreakdown> categoryBreakdown;
  final List<Insight> insights;

  const Analytics({
    required this.id,
    required this.period,
    required this.totalIncome,
    required this.totalExpenses,
    required this.savingsRate,
    required this.spendingTrend,
    required this.categoryBreakdown,
    required this.insights,
  });

  double get netAmount => totalIncome - totalExpenses;

  Analytics copyWith({
    String? id,
    String? period,
    double? totalIncome,
    double? totalExpenses,
    double? savingsRate,
    SpendingTrend? spendingTrend,
    List<CategoryBreakdown>? categoryBreakdown,
    List<Insight>? insights,
  }) {
    return Analytics(
      id: id ?? this.id,
      period: period ?? this.period,
      totalIncome: totalIncome ?? this.totalIncome,
      totalExpenses: totalExpenses ?? this.totalExpenses,
      savingsRate: savingsRate ?? this.savingsRate,
      spendingTrend: spendingTrend ?? this.spendingTrend,
      categoryBreakdown: categoryBreakdown ?? this.categoryBreakdown,
      insights: insights ?? this.insights,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'period': period,
      'totalIncome': totalIncome,
      'totalExpenses': totalExpenses,
      'savingsRate': savingsRate,
      'spendingTrend': spendingTrend.name,
      'categoryBreakdown': categoryBreakdown.map((e) => e.toJson()).toList(),
      'insights': insights.map((e) => e.toJson()).toList(),
    };
  }

  factory Analytics.fromJson(Map<String, dynamic> json) {
    return Analytics(
      id: json['id'] as String,
      period: json['period'] as String,
      totalIncome: json['totalIncome'] as double,
      totalExpenses: json['totalExpenses'] as double,
      savingsRate: json['savingsRate'] as double,
      spendingTrend: SpendingTrend.values.firstWhere(
        (e) => e.name == json['spendingTrend'],
        orElse: () => SpendingTrend.stable,
      ),
      categoryBreakdown: (json['categoryBreakdown'] as List<dynamic>)
          .map((e) => CategoryBreakdown.fromJson(e as Map<String, dynamic>))
          .toList(),
      insights: (json['insights'] as List<dynamic>)
          .map((e) => Insight.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  String toString() {
    return 'Analytics(id: $id, period: $period, totalIncome: $totalIncome, totalExpenses: $totalExpenses, savingsRate: $savingsRate, spendingTrend: $spendingTrend, categoryBreakdown: $categoryBreakdown, insights: $insights)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Analytics &&
        other.id == id &&
        other.period == period &&
        other.totalIncome == totalIncome &&
        other.totalExpenses == totalExpenses &&
        other.savingsRate == savingsRate &&
        other.spendingTrend == spendingTrend;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        period.hashCode ^
        totalIncome.hashCode ^
        totalExpenses.hashCode ^
        savingsRate.hashCode ^
        spendingTrend.hashCode;
  }
}

/// Immutable data model for Category Breakdown in Analytics.
class CategoryBreakdown {
  final String category;
  final double amount;
  final double percentage;
  final int color;

  const CategoryBreakdown({
    required this.category,
    required this.amount,
    required this.percentage,
    required this.color,
  });

  CategoryBreakdown copyWith({
    String? category,
    double? amount,
    double? percentage,
    int? color,
  }) {
    return CategoryBreakdown(
      category: category ?? this.category,
      amount: amount ?? this.amount,
      percentage: percentage ?? this.percentage,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'amount': amount,
      'percentage': percentage,
      'color': color,
    };
  }

  factory CategoryBreakdown.fromJson(Map<String, dynamic> json) {
    return CategoryBreakdown(
      category: json['category'] as String,
      amount: json['amount'] as double,
      percentage: json['percentage'] as double,
      color: json['color'] as int,
    );
  }

  @override
  String toString() {
    return 'CategoryBreakdown(category: $category, amount: $amount, percentage: $percentage, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CategoryBreakdown &&
        other.category == category &&
        other.amount == amount &&
        other.percentage == percentage &&
        other.color == color;
  }

  @override
  int get hashCode {
    return category.hashCode ^ amount.hashCode ^ percentage.hashCode ^ color.hashCode;
  }
}

/// Immutable data model for Analytics Insights.
class Insight {
  final String label;
  final String value;
  final InsightType type;

  const Insight({
    required this.label,
    required this.value,
    required this.type,
  });

  Insight copyWith({
    String? label,
    String? value,
    InsightType? type,
  }) {
    return Insight(
      label: label ?? this.label,
      value: value ?? this.value,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'value': value,
      'type': type.name,
    };
  }

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(
      label: json['label'] as String,
      value: json['value'] as String,
      type: InsightType.values.firstWhere(
        (e) => e.name == json['type'],
        orElse: () => InsightType.general,
      ),
    );
  }

  @override
  String toString() {
    return 'Insight(label: $label, value: $value, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Insight &&
        other.label == label &&
        other.value == value &&
        other.type == type;
  }

  @override
  int get hashCode {
    return label.hashCode ^ value.hashCode ^ type.hashCode;
  }
}

/// Spending trend enum for analytics.
enum SpendingTrend {
  up,
  down,
  stable,
}

extension SpendingTrendExtension on SpendingTrend {
  String get displayName {
    switch (this) {
      case SpendingTrend.up:
        return 'Up';
      case SpendingTrend.down:
        return 'Down';
      case SpendingTrend.stable:
        return 'Stable';
    }
  }
}

/// Insight type enum for analytics.
enum InsightType {
  positive,
  negative,
  warning,
  general,
}

extension InsightTypeExtension on InsightType {
  String get displayName {
    switch (this) {
      case InsightType.positive:
        return 'Positive';
      case InsightType.negative:
        return 'Negative';
      case InsightType.warning:
        return 'Warning';
      case InsightType.general:
        return 'General';
    }
  }
}
