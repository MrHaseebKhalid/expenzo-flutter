import '../services/hive_service.dart';
import 'settings_repository.dart';

/// Hive implementation of SettingsRepository
class SettingsRepositoryImpl implements SettingsRepository {
  final HiveService _hiveService;

  SettingsRepositoryImpl(this._hiveService);

  @override
  Future<T?> getSetting<T>(String key) async {
    final box = _hiveService.userSettings;
    return box.get(key) as T?;
  }

  @override
  Future<void> saveSetting<T>(String key, T value) async {
    final box = _hiveService.userSettings;
    await box.put(key, value);
  }

  @override
  Future<void> deleteSetting(String key) async {
    final box = _hiveService.userSettings;
    await box.delete(key);
  }

  @override
  Future<void> clearAllSettings() async {
    final box = _hiveService.userSettings;
    await box.clear();
  }
}
