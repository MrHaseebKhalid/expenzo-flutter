/// Immutable data model for a Reminder.
class Reminder {
  final String id;
  final String title;
  final ReminderStatus status;
  final DateTime finalDate;
  final int daysLeft;
  final String category;
  final String? description;
  final bool isChecked;

  const Reminder({
    required this.id,
    required this.title,
    required this.status,
    required this.finalDate,
    required this.daysLeft,
    required this.category,
    this.description,
    this.isChecked = false,
  });

  Reminder copyWith({
    String? id,
    String? title,
    ReminderStatus? status,
    DateTime? finalDate,
    int? daysLeft,
    String? category,
    String? description,
    bool? isChecked,
  }) {
    return Reminder(
      id: id ?? this.id,
      title: title ?? this.title,
      status: status ?? this.status,
      finalDate: finalDate ?? this.finalDate,
      daysLeft: daysLeft ?? this.daysLeft,
      category: category ?? this.category,
      description: description ?? this.description,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'status': status.name,
      'finalDate': finalDate.toIso8601String(),
      'daysLeft': daysLeft,
      'category': category,
      'description': description,
      'isChecked': isChecked,
    };
  }

  factory Reminder.fromJson(Map<String, dynamic> json) {
    return Reminder(
      id: json['id'] as String,
      title: json['title'] as String,
      status: ReminderStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => ReminderStatus.pending,
      ),
      finalDate: DateTime.parse(json['finalDate'] as String),
      daysLeft: json['daysLeft'] as int,
      category: json['category'] as String,
      description: json['description'] as String?,
      isChecked: json['isChecked'] as bool? ?? false,
    );
  }

  @override
  String toString() {
    return 'Reminder(id: $id, title: $title, status: $status, finalDate: $finalDate, daysLeft: $daysLeft, category: $category, isChecked: $isChecked)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Reminder &&
        other.id == id &&
        other.title == title &&
        other.status == status &&
        other.finalDate == finalDate &&
        other.daysLeft == daysLeft &&
        other.category == category &&
        other.description == description &&
        other.isChecked == isChecked;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        status.hashCode ^
        finalDate.hashCode ^
        daysLeft.hashCode ^
        category.hashCode ^
        description.hashCode ^
        isChecked.hashCode;
  }
}

/// Status enum for reminders.
enum ReminderStatus {
  completed,
  pending,
  overdue,
}

extension ReminderStatusExtension on ReminderStatus {
  String get displayName {
    switch (this) {
      case ReminderStatus.completed:
        return 'Completed';
      case ReminderStatus.pending:
        return 'Pending';
      case ReminderStatus.overdue:
        return 'Overdue';
    }
  }
}
