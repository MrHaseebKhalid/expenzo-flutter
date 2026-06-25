import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Firebase Authentication Service
///
/// Handles all Firebase Authentication operations
class AuthService {
  static AuthService? _instance;
  static AuthService get instance => _instance ??= AuthService._();

  AuthService._();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Get auth state changes stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// Check if user is logged in
  bool get isLoggedIn => _auth.currentUser != null;

  /// Check if email is verified
  bool get isEmailVerified => _auth.currentUser?.emailVerified ?? false;

  /// Register with email and password
  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Send email verification
      await userCredential.user?.sendEmailVerification();

      debugPrint('User registered successfully');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint('Registration failed: ${e.code}');
      rethrow;
    }
  }

  /// Login with email and password
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      debugPrint('User logged in successfully');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      debugPrint('Login failed: ${e.code}');
      rethrow;
    }
  }

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      debugPrint('Password reset email sent');
    } on FirebaseAuthException catch (e) {
      debugPrint('Password reset failed: ${e.code}');
      rethrow;
    }
  }

  /// Confirm password reset
  Future<void> confirmPasswordReset({
    required String code,
    required String newPassword,
  }) async {
    try {
      await _auth.confirmPasswordReset(code: code, newPassword: newPassword);
      debugPrint('Password reset confirmed');
    } on FirebaseAuthException catch (e) {
      debugPrint('Password reset confirmation failed: ${e.code}');
      rethrow;
    }
  }

  /// Update password
  Future<void> updatePassword(String newPassword) async {
    try {
      await _auth.currentUser?.updatePassword(newPassword);
      debugPrint('Password updated successfully');
    } on FirebaseAuthException catch (e) {
      debugPrint('Password update failed: ${e.code}');
      rethrow;
    }
  }

  /// Send email verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      debugPrint('Email verification sent');
    } on FirebaseAuthException catch (e) {
      debugPrint('Email verification failed: ${e.code}');
      rethrow;
    }
  }

  /// Reload user data
  Future<void> reloadUser() async {
    try {
      await _auth.currentUser?.reload();
      debugPrint('User data reloaded');
    } on FirebaseAuthException catch (e) {
      debugPrint('User reload failed: ${e.code}');
      rethrow;
    }
  }

  /// Logout
  Future<void> signOut() async {
    try {
      await _auth.signOut();
      debugPrint('User logged out successfully');
    } on FirebaseAuthException catch (e) {
      debugPrint('Logout failed: ${e.code}');
      rethrow;
    }
  }

  /// Delete user account
  Future<void> deleteAccount() async {
    try {
      await _auth.currentUser?.delete();
      debugPrint('User account deleted successfully');
    } on FirebaseAuthException catch (e) {
      debugPrint('Account deletion failed: ${e.code}');
      rethrow;
    }
  }

  /// Update user display name
  Future<void> updateDisplayName(String displayName) async {
    try {
      await _auth.currentUser?.updateDisplayName(displayName);
      debugPrint('Display name updated successfully');
    } on FirebaseAuthException catch (e) {
      debugPrint('Display name update failed: ${e.code}');
      rethrow;
    }
  }

  /// Update user email
  Future<void> updateUserEmail(String newEmail) async {
    try {
      await _auth.currentUser?.verifyBeforeUpdateEmail(newEmail);
      debugPrint('Email update verification sent');
    } on FirebaseAuthException catch (e) {
      debugPrint('Email update failed: ${e.code}');
      rethrow;
    }
  }
}
