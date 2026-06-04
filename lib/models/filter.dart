/// Immutable data model for Transaction/Expense Filter.
class Filter {
  final DateRange? dateRange;
  final List<String>? categories;
  final AmountRange? amountRange;
  final SortBy sortBy;
  final SortOrder sortOrder;

  const Filter({
    this.dateRange,
    this.categories,
    this.amountRange,
    this.sortBy = SortBy.date,
    this.sortOrder = SortOrder.descending,
  });

  Filter copyWith({
    DateRange? dateRange,
    List<String>? categories,
    AmountRange? amountRange,
    SortBy? sortBy,
    SortOrder? sortOrder,
  }) {
    return Filter(
      dateRange: dateRange ?? this.dateRange,
      categories: categories ?? this.categories,
      amountRange: amountRange ?? this.amountRange,
      sortBy: sortBy ?? this.sortBy,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  Filter clearFilters() {
    return const Filter(
      sortBy: SortBy.date,
      sortOrder: SortOrder.descending,
    );
  }

  bool get hasActiveFilters =>
      dateRange != null ||
      (categories != null && categories!.isNotEmpty) ||
      amountRange != null;

  Map<String, dynamic> toJson() {
    return {
      'dateRange': dateRange?.toJson(),
      'categories': categories,
      'amountRange': amountRange?.toJson(),
      'sortBy': sortBy.name,
      'sortOrder': sortOrder.name,
    };
  }

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      dateRange: json['dateRange'] != null
          ? DateRange.fromJson(json['dateRange'] as Map<String, dynamic>)
          : null,
      categories: json['categories'] != null
          ? List<String>.from(json['categories'] as List)
          : null,
      amountRange: json['amountRange'] != null
          ? AmountRange.fromJson(json['amountRange'] as Map<String, dynamic>)
          : null,
      sortBy: SortBy.values.firstWhere(
        (e) => e.name == json['sortBy'],
        orElse: () => SortBy.date,
      ),
      sortOrder: SortOrder.values.firstWhere(
        (e) => e.name == json['sortOrder'],
        orElse: () => SortOrder.descending,
      ),
    );
  }

  @override
  String toString() {
    return 'Filter(dateRange: $dateRange, categories: $categories, amountRange: $amountRange, sortBy: $sortBy, sortOrder: $sortOrder)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Filter &&
        other.dateRange == dateRange &&
        _listEquals(other.categories, categories) &&
        other.amountRange == amountRange &&
        other.sortBy == sortBy &&
        other.sortOrder == sortOrder;
  }

  @override
  int get hashCode {
    return dateRange.hashCode ^
        categories.hashCode ^
        amountRange.hashCode ^
        sortBy.hashCode ^
        sortOrder.hashCode;
  }

  bool _listEquals(List<String>? a, List<String>? b) {
    if (a == null && b == null) return true;
    if (a == null || b == null) return false;
    if (a.length != b.length) return false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

/// Immutable data model for Date Range.
class DateRange {
  final DateTime startDate;
  final DateTime endDate;

  const DateRange({
    required this.startDate,
    required this.endDate,
  });

  DateRange copyWith({
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return DateRange(
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
    };
  }

  factory DateRange.fromJson(Map<String, dynamic> json) {
    return DateRange(
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );
  }

  @override
  String toString() {
    return 'DateRange(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DateRange &&
        other.startDate == startDate &&
        other.endDate == endDate;
  }

  @override
  int get hashCode {
    return startDate.hashCode ^ endDate.hashCode;
  }
}

/// Immutable data model for Amount Range.
class AmountRange {
  final double min;
  final double max;

  const AmountRange({
    required this.min,
    required this.max,
  });

  AmountRange copyWith({
    double? min,
    double? max,
  }) {
    return AmountRange(
      min: min ?? this.min,
      max: max ?? this.max,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
    };
  }

  factory AmountRange.fromJson(Map<String, dynamic> json) {
    return AmountRange(
      min: json['min'] as double,
      max: json['max'] as double,
    );
  }

  @override
  String toString() {
    return 'AmountRange(min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AmountRange &&
        other.min == min &&
        other.max == max;
  }

  @override
  int get hashCode {
    return min.hashCode ^ max.hashCode;
  }
}

/// Sort by enum for filters.
enum SortBy {
  date,
  amount,
  category,
  title,
}

extension SortByExtension on SortBy {
  String get displayName {
    switch (this) {
      case SortBy.date:
        return 'Date';
      case SortBy.amount:
        return 'Amount';
      case SortBy.category:
        return 'Category';
      case SortBy.title:
        return 'Title';
    }
  }
}

/// Sort order enum for filters.
enum SortOrder {
  ascending,
  descending,
}

extension SortOrderExtension on SortOrder {
  String get displayName {
    switch (this) {
      case SortOrder.ascending:
        return 'Ascending';
      case SortOrder.descending:
        return 'Descending';
    }
  }
}
