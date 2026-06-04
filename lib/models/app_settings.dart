/// Immutable data model for App Settings.
class AppSettings {
  final AppTheme theme;
  final String currency;
  final String timeFormat;
  final bool accountSettingsEnabled;
  final bool securitySettingsEnabled;

  const AppSettings({
    required this.theme,
    required this.currency,
    required this.timeFormat,
    this.accountSettingsEnabled = true,
    this.securitySettingsEnabled = true,
  });

  AppSettings copyWith({
    AppTheme? theme,
    String? currency,
    String? timeFormat,
    bool? accountSettingsEnabled,
    bool? securitySettingsEnabled,
  }) {
    return AppSettings(
      theme: theme ?? this.theme,
      currency: currency ?? this.currency,
      timeFormat: timeFormat ?? this.timeFormat,
      accountSettingsEnabled: accountSettingsEnabled ?? this.accountSettingsEnabled,
      securitySettingsEnabled: securitySettingsEnabled ?? this.securitySettingsEnabled,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'theme': theme.name,
      'currency': currency,
      'timeFormat': timeFormat,
      'accountSettingsEnabled': accountSettingsEnabled,
      'securitySettingsEnabled': securitySettingsEnabled,
    };
  }

  factory AppSettings.fromJson(Map<String, dynamic> json) {
    return AppSettings(
      theme: AppTheme.values.firstWhere(
        (e) => e.name == json['theme'],
        orElse: () => AppTheme.light,
      ),
      currency: json['currency'] as String,
      timeFormat: json['timeFormat'] as String,
      accountSettingsEnabled: json['accountSettingsEnabled'] as bool? ?? true,
      securitySettingsEnabled: json['securitySettingsEnabled'] as bool? ?? true,
    );
  }

  @override
  String toString() {
    return 'AppSettings(theme: $theme, currency: $currency, timeFormat: $timeFormat, accountSettingsEnabled: $accountSettingsEnabled, securitySettingsEnabled: $securitySettingsEnabled)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppSettings &&
        other.theme == theme &&
        other.currency == currency &&
        other.timeFormat == timeFormat &&
        other.accountSettingsEnabled == accountSettingsEnabled &&
        other.securitySettingsEnabled == securitySettingsEnabled;
  }

  @override
  int get hashCode {
    return theme.hashCode ^
        currency.hashCode ^
        timeFormat.hashCode ^
        accountSettingsEnabled.hashCode ^
        securitySettingsEnabled.hashCode;
  }
}

/// Theme enum for app settings.
enum AppTheme {
  light,
  dark,
  system,
}

extension AppThemeExtension on AppTheme {
  String get displayName {
    switch (this) {
      case AppTheme.light:
        return 'Light';
      case AppTheme.dark:
        return 'Dark';
      case AppTheme.system:
        return 'System';
    }
  }
}
