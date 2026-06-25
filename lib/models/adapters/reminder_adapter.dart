import 'package:hive/hive.dart';
import '../reminder_model.dart';

part 'reminder_adapter.g.dart';

@HiveType(typeId: 4)
class HiveReminder {
  @HiveField(0)
  final String id;
  
  @HiveField(1)
  final String title;
  
  @HiveField(2)
  final String status;
  
  @HiveField(3)
  final DateTime finalDate;
  
  @HiveField(4)
  final int daysLeft;
  
  @HiveField(5)
  final String category;
  
  @HiveField(6)
  final String? description;
  
  @HiveField(7)
  final bool isChecked;

  HiveReminder({
    required this.id,
    required this.title,
    required this.status,
    required this.finalDate,
    required this.daysLeft,
    required this.category,
    this.description,
    this.isChecked = false,
  });

  Reminder toReminder() {
    return Reminder(
      id: id,
      title: title,
      status: ReminderStatus.values.firstWhere(
        (e) => e.name == status,
        orElse: () => ReminderStatus.pending,
      ),
      finalDate: finalDate,
      daysLeft: daysLeft,
      category: category,
      description: description,
      isChecked: isChecked,
    );
  }

  factory HiveReminder.fromReminder(Reminder reminder) {
    return HiveReminder(
      id: reminder.id,
      title: reminder.title,
      status: reminder.status.name,
      finalDate: reminder.finalDate,
      daysLeft: reminder.daysLeft,
      category: reminder.category,
      description: reminder.description,
      isChecked: reminder.isChecked,
    );
  }
}
