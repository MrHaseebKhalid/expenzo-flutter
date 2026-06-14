/// Immutable data model for a Transaction.
class Transaction {
  final String id;
  final String title;
  final String category;
  final DateTime date;
  final double amount;
  final String paymentMethod;
  final String? description;
  final TransactionStatus status;

  const Transaction({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
    required this.paymentMethod,
    this.description,
    this.status = TransactionStatus.completed,
  });

  Transaction copyWith({
    String? id,
    String? title,
    String? category,
    DateTime? date,
    double? amount,
    String? paymentMethod,
    String? description,
    TransactionStatus? status,
  }) {
    return Transaction(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      date: date ?? this.date,
      amount: amount ?? this.amount,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'date': date.toIso8601String(),
      'amount': amount,
      'paymentMethod': paymentMethod,
      'description': description,
      'status': status.name,
    };
  }

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      date: DateTime.parse(json['date'] as String),
      amount: json['amount'] as double,
      paymentMethod: json['paymentMethod'] as String,
      description: json['description'] as String?,
      status: TransactionStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => TransactionStatus.completed,
      ),
    );
  }

  @override
  String toString() {
    return 'Transaction(id: $id, title: $title, category: $category, date: $date, amount: $amount, paymentMethod: $paymentMethod, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Transaction &&
        other.id == id &&
        other.title == title &&
        other.category == category &&
        other.date == date &&
        other.amount == amount &&
        other.paymentMethod == paymentMethod &&
        other.description == description &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        category.hashCode ^
        date.hashCode ^
        amount.hashCode ^
        paymentMethod.hashCode ^
        description.hashCode ^
        status.hashCode;
  }
}

/// Status enum for transactions.
enum TransactionStatus {
  completed,
  pending,
  cancelled,
}

extension TransactionStatusExtension on TransactionStatus {
  String get displayName {
    switch (this) {
      case TransactionStatus.completed:
        return 'Completed';
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.cancelled:
        return 'Cancelled';
    }
  }
}
