/// Repository interface for Settings operations
abstract class SettingsRepository {
  /// Get setting value
  Future<T?> getSetting<T>(String key);

  /// Save setting value
  Future<void> saveSetting<T>(String key, T value);

  /// Delete setting
  Future<void> deleteSetting(String key);

  /// Clear all settings
  Future<void> clearAllSettings();
}
