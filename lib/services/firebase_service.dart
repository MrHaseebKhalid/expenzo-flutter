import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

/// Firebase Service
///
/// Handles Firebase initialization and provides access to Firebase services
class FirebaseService {
  static FirebaseService? _instance;
  static FirebaseService get instance => _instance ??= FirebaseService._();

  FirebaseService._();

  FirebaseAnalytics? _analytics;
  FirebaseCrashlytics? _crashlytics;

  FirebaseAnalytics get analytics => _analytics!;
  FirebaseCrashlytics get crashlytics => _crashlytics!;

  /// Initialize Firebase
  ///
  /// Must be called before using any Firebase services
  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp();

      // Create instance
      _instance = FirebaseService._();

      // Initialize Analytics
      _instance!._analytics = FirebaseAnalytics.instance;

      // Initialize Crashlytics
      _instance!._crashlytics = FirebaseCrashlytics.instance;

      // Enable Crashlytics for testing (enable in both debug and release)
      await _instance!._crashlytics!.setCrashlyticsCollectionEnabled(true);

      // Set Crashlytics to catch Flutter errors
      FlutterError.onError = (errorDetails) {
        _instance!._crashlytics!.recordError(
          errorDetails.exception,
          errorDetails.stack,
          fatal: true,
        );
      };

      // Set Crashlytics to catch platform errors
      PlatformDispatcher.instance.onError = (error, stack) {
        _instance!._crashlytics!.recordError(error, stack, fatal: true);
        return true;
      };

      debugPrint('Firebase initialized successfully');
    } catch (e) {
      debugPrint('Firebase initialization failed: $e');
      rethrow;
    }
  }

  /// Log app open event
  Future<void> logAppOpen() async {
    await _analytics!.logAppOpen();
  }

  /// Log custom event
  Future<void> logEvent(String name, {Map<String, Object>? parameters}) async {
    await _analytics!.logEvent(name: name, parameters: parameters);
  }

  /// Set user ID for analytics
  Future<void> setUserId(String userId) async {
    await _analytics!.setUserId(id: userId);
  }

  /// Set user property for analytics
  Future<void> setUserProperty(String name, String? value) async {
    await _analytics!.setUserProperty(name: name, value: value);
  }

  /// Record non-fatal error
  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    bool fatal = false,
  }) async {
    await _crashlytics!.recordError(exception, stack, fatal: fatal);
  }

  /// Record custom exception
  Future<void> recordException(dynamic exception, {bool fatal = false}) async {
    await _crashlytics!.recordError(exception, null, fatal: fatal);
  }
}
