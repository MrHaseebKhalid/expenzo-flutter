import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import '../models/user_profile.dart';

/// User Service
///
/// Handles user profile management with Firestore and Firebase Storage
class UserService {
  static UserService? _instance;
  static UserService get instance => _instance ??= UserService._();

  UserService._();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static const String _usersCollection = 'users';

  /// Create user profile in Firestore
  Future<void> createUserProfile(UserProfile userProfile) async {
    try {
      await _firestore
          .collection(_usersCollection)
          .doc(userProfile.uid)
          .set(userProfile.toJson());

      debugPrint('User profile created: ${userProfile.uid}');
    } catch (e) {
      debugPrint('Failed to create user profile: $e');
      rethrow;
    }
  }

  /// Get user profile by UID
  Future<UserProfile?> getUserProfile(String uid) async {
    try {
      final docSnapshot = await _firestore
          .collection(_usersCollection)
          .doc(uid)
          .get();

      if (!docSnapshot.exists) return null;

      return UserProfile.fromJson(docSnapshot.data()!);
    } catch (e) {
      debugPrint('Failed to get user profile: $e');
      rethrow;
    }
  }

  /// Get current user profile
  Future<UserProfile?> getCurrentUserProfile() async {
    final user = _auth.currentUser;
    if (user == null) return null;

    return getUserProfile(user.uid);
  }

  /// Update user profile
  Future<void> updateUserProfile(UserProfile userProfile) async {
    try {
      await _firestore
          .collection(_usersCollection)
          .doc(userProfile.uid)
          .update(userProfile.toJson());

      debugPrint('User profile updated: ${userProfile.uid}');
    } catch (e) {
      debugPrint('Failed to update user profile: $e');
      rethrow;
    }
  }

  /// Update user display name
  Future<void> updateDisplayName(String uid, String displayName) async {
    try {
      await _firestore.collection(_usersCollection).doc(uid).update({
        'displayName': displayName,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      debugPrint('Display name updated: $displayName');
    } catch (e) {
      debugPrint('Failed to update display name: $e');
      rethrow;
    }
  }

  /// Update user phone number
  Future<void> updatePhoneNumber(String uid, String phoneNumber) async {
    try {
      await _firestore.collection(_usersCollection).doc(uid).update({
        'phoneNumber': phoneNumber,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      debugPrint('Phone number updated: $phoneNumber');
    } catch (e) {
      debugPrint('Failed to update phone number: $e');
      rethrow;
    }
  }

  /// Upload profile image from bytes
  Future<String> uploadProfileImageFromBytes(
    String uid,
    List<int> bytes,
  ) async {
    try {
      final file = _storage.ref().child('profile_images/$uid.jpg');

      final uploadTask = file.putData(Uint8List.fromList(bytes));

      final snapshot = await uploadTask;
      final downloadUrl = await snapshot.ref.getDownloadURL();

      debugPrint('Profile image uploaded: $downloadUrl');

      // Update user profile with new photo URL
      await _firestore.collection(_usersCollection).doc(uid).update({
        'photoUrl': downloadUrl,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      return downloadUrl;
    } catch (e) {
      debugPrint('Failed to upload profile image: $e');
      rethrow;
    }
  }

  /// Delete profile image
  Future<void> deleteProfileImage(String uid) async {
    try {
      await _storage.ref().child('profile_images/$uid.jpg').delete();

      // Update user profile to remove photo URL
      await _firestore.collection(_usersCollection).doc(uid).update({
        'photoUrl': null,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      debugPrint('Profile image deleted');
    } catch (e) {
      debugPrint('Failed to delete profile image: $e');
      rethrow;
    }
  }

  /// Update user preferences
  Future<void> updateUserPreferences(
    String uid,
    Map<String, dynamic> preferences,
  ) async {
    try {
      await _firestore.collection(_usersCollection).doc(uid).update({
        'preferences': preferences,
        'updatedAt': DateTime.now().toIso8601String(),
      });

      debugPrint('User preferences updated');
    } catch (e) {
      debugPrint('Failed to update user preferences: $e');
      rethrow;
    }
  }

  /// Delete user profile
  Future<void> deleteUserProfile(String uid) async {
    try {
      await _firestore.collection(_usersCollection).doc(uid).delete();

      debugPrint('User profile deleted: $uid');
    } catch (e) {
      debugPrint('Failed to delete user profile: $e');
      rethrow;
    }
  }

  /// Stream user profile changes
  Stream<UserProfile?> userProfileStream(String uid) {
    return _firestore.collection(_usersCollection).doc(uid).snapshots().map((
      snapshot,
    ) {
      if (!snapshot.exists) return null;
      return UserProfile.fromJson(snapshot.data()!);
    });
  }

  /// Stream current user profile changes
  Stream<UserProfile?> currentUserProfileStream() {
    final user = _auth.currentUser;
    if (user == null) {
      return Stream.value(null);
    }
    return userProfileStream(user.uid);
  }
}
