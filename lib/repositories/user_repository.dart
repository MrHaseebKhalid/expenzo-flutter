import '../models/user_model.dart';

/// Repository interface for User operations
abstract class UserRepository {
  /// Get current user
  Future<User?> getCurrentUser();

  /// Save user
  Future<void> saveUser(User user);

  /// Update user
  Future<void> updateUser(User user);

  /// Delete user
  Future<void> deleteUser(String userId);

  /// Clear all users
  Future<void> clearAllUsers();
}
