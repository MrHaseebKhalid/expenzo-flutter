/// Immutable data model for Notification Settings.
class NotificationSettings {
  final String remainderTime;
  final String remainderFrequency;
  final String budgetAlerts;
  final String expensesAlerts;
  final bool updatesEnabled;
  final bool notificationsEnabled;
  final bool inAppNotificationsEnabled;

  const NotificationSettings({
    required this.remainderTime,
    required this.remainderFrequency,
    required this.budgetAlerts,
    required this.expensesAlerts,
    this.updatesEnabled = false,
    this.notificationsEnabled = true,
    this.inAppNotificationsEnabled = true,
  });

  NotificationSettings copyWith({
    String? remainderTime,
    String? remainderFrequency,
    String? budgetAlerts,
    String? expensesAlerts,
    bool? updatesEnabled,
    bool? notificationsEnabled,
    bool? inAppNotificationsEnabled,
  }) {
    return NotificationSettings(
      remainderTime: remainderTime ?? this.remainderTime,
      remainderFrequency: remainderFrequency ?? this.remainderFrequency,
      budgetAlerts: budgetAlerts ?? this.budgetAlerts,
      expensesAlerts: expensesAlerts ?? this.expensesAlerts,
      updatesEnabled: updatesEnabled ?? this.updatesEnabled,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      inAppNotificationsEnabled: inAppNotificationsEnabled ?? this.inAppNotificationsEnabled,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'remainderTime': remainderTime,
      'remainderFrequency': remainderFrequency,
      'budgetAlerts': budgetAlerts,
      'expensesAlerts': expensesAlerts,
      'updatesEnabled': updatesEnabled,
      'notificationsEnabled': notificationsEnabled,
      'inAppNotificationsEnabled': inAppNotificationsEnabled,
    };
  }

  factory NotificationSettings.fromJson(Map<String, dynamic> json) {
    return NotificationSettings(
      remainderTime: json['remainderTime'] as String,
      remainderFrequency: json['remainderFrequency'] as String,
      budgetAlerts: json['budgetAlerts'] as String,
      expensesAlerts: json['expensesAlerts'] as String,
      updatesEnabled: json['updatesEnabled'] as bool? ?? false,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
      inAppNotificationsEnabled: json['inAppNotificationsEnabled'] as bool? ?? true,
    );
  }

  @override
  String toString() {
    return 'NotificationSettings(remainderTime: $remainderTime, remainderFrequency: $remainderFrequency, budgetAlerts: $budgetAlerts, expensesAlerts: $expensesAlerts, updatesEnabled: $updatesEnabled, notificationsEnabled: $notificationsEnabled, inAppNotificationsEnabled: $inAppNotificationsEnabled)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationSettings &&
        other.remainderTime == remainderTime &&
        other.remainderFrequency == remainderFrequency &&
        other.budgetAlerts == budgetAlerts &&
        other.expensesAlerts == expensesAlerts &&
        other.updatesEnabled == updatesEnabled &&
        other.notificationsEnabled == notificationsEnabled &&
        other.inAppNotificationsEnabled == inAppNotificationsEnabled;
  }

  @override
  int get hashCode {
    return remainderTime.hashCode ^
        remainderFrequency.hashCode ^
        budgetAlerts.hashCode ^
        expensesAlerts.hashCode ^
        updatesEnabled.hashCode ^
        notificationsEnabled.hashCode ^
        inAppNotificationsEnabled.hashCode;
  }
}
