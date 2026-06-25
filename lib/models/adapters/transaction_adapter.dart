import 'package:hive/hive.dart';
import '../transaction_model.dart';

part 'transaction_adapter.g.dart';

@HiveType(typeId: 3)
class HiveTransaction {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String title;
  
  @HiveField(2)
  final String category;
  
  @HiveField(3)
  final DateTime date;
  
  @HiveField(4)
  final double amount;
  
  @HiveField(5)
  final String paymentMethod;
  
  @HiveField(6)
  final String? description;
  
  @HiveField(7)
  final String status;

  HiveTransaction({
    required this.id,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
    required this.paymentMethod,
    this.description,
    required this.status,
  });

  Transaction toTransaction() {
    return Transaction(
      id: id,
      title: title,
      category: category,
      date: date,
      amount: amount,
      paymentMethod: paymentMethod,
      description: description,
      status: TransactionStatus.values.firstWhere(
        (e) => e.name == status,
        orElse: () => TransactionStatus.completed,
      ),
    );
  }

  factory HiveTransaction.fromTransaction(Transaction transaction) {
    return HiveTransaction(
      id: transaction.id,
      title: transaction.title,
      category: transaction.category,
      date: transaction.date,
      amount: transaction.amount,
      paymentMethod: transaction.paymentMethod,
      description: transaction.description,
      status: transaction.status.name,
    );
  }
}
