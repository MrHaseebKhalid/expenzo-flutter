import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/adapters/expense_adapter.dart';
import '../models/adapters/budget_adapter.dart';
import '../models/adapters/transaction_adapter.dart';
import '../models/adapters/reminder_adapter.dart';

/// Hive Service
///
/// Handles Hive initialization and management of local storage boxes
class HiveService {
  static HiveService? _instance;
  static HiveService get instance => _instance ??= HiveService._();

  HiveService._();

  // Box names
  static const String expensesBox = 'expenses';
  static const String budgetsBox = 'budgets';
  static const String userSettingsBox = 'user_settings';
  static const String offlineCacheBox = 'offline_cache';
  static const String transactionsBox = 'transactions';
  static const String categoriesBox = 'categories';
  static const String remindersBox = 'reminders';
  static const String usersBox = 'users';

  /// Initialize Hive
  ///
  /// Must be called before using any Hive boxes
  static Future<void> initialize() async {
    try {
      // Initialize Hive
      await Hive.initFlutter();

      // Register TypeAdapters
      Hive.registerAdapter(HiveExpenseAdapter());
      Hive.registerAdapter(HiveBudgetAdapter());
      Hive.registerAdapter(HiveBudgetCategoryAdapter());
      Hive.registerAdapter(HiveTransactionAdapter());
      Hive.registerAdapter(HiveReminderAdapter());

      // Open boxes
      await Hive.openBox(expensesBox);
      await Hive.openBox(budgetsBox);
      await Hive.openBox(userSettingsBox);
      await Hive.openBox(offlineCacheBox);
      await Hive.openBox(transactionsBox);
      await Hive.openBox(categoriesBox);
      await Hive.openBox(remindersBox);
      await Hive.openBox(usersBox);

      debugPrint('Hive initialized successfully');
    } catch (e) {
      debugPrint('Hive initialization failed: $e');
      rethrow;
    }
  }

  /// Get expenses box
  Box get expenses => Hive.box(expensesBox);

  /// Get budgets box
  Box get budgets => Hive.box(budgetsBox);

  /// Get user settings box
  Box get userSettings => Hive.box(userSettingsBox);

  /// Get offline cache box
  Box get offlineCache => Hive.box(offlineCacheBox);

  /// Get transactions box
  Box get transactions => Hive.box(transactionsBox);

  /// Get categories box
  Box get categories => Hive.box(categoriesBox);

  /// Get reminders box
  Box get reminders => Hive.box(remindersBox);

  /// Get users box
  Box get users => Hive.box(usersBox);

  /// Clear all boxes (useful for testing or logout)
  Future<void> clearAllBoxes() async {
    await expenses.clear();
    await budgets.clear();
    await userSettings.clear();
    await offlineCache.clear();
    await transactions.clear();
    await categories.clear();
    await reminders.clear();
    await users.clear();
    debugPrint('All Hive boxes cleared');
  }

  /// Close all boxes
  static Future<void> close() async {
    await Hive.close();
    debugPrint('Hive closed');
  }
}
