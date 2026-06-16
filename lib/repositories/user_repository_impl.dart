import '../models/user_model.dart';
import '../services/hive_service.dart';
import 'user_repository.dart';

/// Hive implementation of UserRepository
class UserRepositoryImpl implements UserRepository {
  final HiveService _hiveService;

  UserRepositoryImpl(this._hiveService);

  @override
  Future<User?> getCurrentUser() async {
    final box = _hiveService.users;
    
    if (box.isEmpty) return null;
    
    final json = box.getAt(0) as Map<String, dynamic>?;
    
    if (json == null) return null;
    
    return User.fromJson(json);
  }

  @override
  Future<void> saveUser(User user) async {
    final box = _hiveService.users;
    await box.put(user.id, user.toJson());
  }

  @override
  Future<void> updateUser(User user) async {
    final box = _hiveService.users;
    await box.put(user.id, user.toJson());
  }

  @override
  Future<void> deleteUser(String userId) async {
    final box = _hiveService.users;
    await box.delete(userId);
  }

  @override
  Future<void> clearAllUsers() async {
    final box = _hiveService.users;
    await box.clear();
  }
}
