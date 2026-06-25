import 'package:flutter/foundation.dart';
import '../models/adapters/reminder_adapter.dart';
import '../models/reminder_model.dart';
import 'hive_service.dart';

/// Reminder Service
///
/// Handles reminder business logic with Hive local storage
class ReminderService {
  static ReminderService? _instance;
  static ReminderService get instance => _instance ??= ReminderService._();

  ReminderService._();

  final HiveService _hiveService = HiveService.instance;

  /// Add a new reminder
  Future<void> addReminder(Reminder reminder) async {
    try {
      final box = _hiveService.reminders;
      final hiveReminder = HiveReminder.fromReminder(reminder);
      await box.put(reminder.id, hiveReminder);
      debugPrint('Reminder added: ${reminder.id}');
    } catch (e) {
      debugPrint('Failed to add reminder: $e');
      rethrow;
    }
  }

  /// Update an existing reminder
  Future<void> updateReminder(Reminder reminder) async {
    try {
      final box = _hiveService.reminders;
      final hiveReminder = HiveReminder.fromReminder(reminder);
      await box.put(reminder.id, hiveReminder);
      debugPrint('Reminder updated: ${reminder.id}');
    } catch (e) {
      debugPrint('Failed to update reminder: $e');
      rethrow;
    }
  }

  /// Delete a reminder
  Future<void> deleteReminder(String reminderId) async {
    try {
      final box = _hiveService.reminders;
      await box.delete(reminderId);
      debugPrint('Reminder deleted: $reminderId');
    } catch (e) {
      debugPrint('Failed to delete reminder: $e');
      rethrow;
    }
  }

  /// Get a reminder by ID
  Reminder? getReminder(String reminderId) {
    try {
      final box = _hiveService.reminders;
      final hiveReminder = box.get(reminderId);
      if (hiveReminder == null) return null;
      return hiveReminder.toReminder();
    } catch (e) {
      debugPrint('Failed to get reminder: $e');
      return null;
    }
  }

  /// Get all reminders
  List<Reminder> getAllReminders() {
    try {
      final box = _hiveService.reminders;
      return box.values.cast<HiveReminder>().map((hiveReminder) => hiveReminder.toReminder()).toList();
    } catch (e) {
      debugPrint('Failed to get all reminders: $e');
      return [];
    }
  }

  /// Get reminders by status
  List<Reminder> getRemindersByStatus(ReminderStatus status) {
    try {
      final box = _hiveService.reminders;
      return box.values
          .cast<HiveReminder>()
          .map((hiveReminder) => hiveReminder.toReminder())
          .where((reminder) => reminder.status == status)
          .toList();
    } catch (e) {
      debugPrint('Failed to get reminders by status: $e');
      return [];
    }
  }

  /// Get reminders by category
  List<Reminder> getRemindersByCategory(String category) {
    try {
      final box = _hiveService.reminders;
      return box.values
          .cast<HiveReminder>()
          .map((hiveReminder) => hiveReminder.toReminder())
          .where((reminder) => reminder.category == category)
          .toList();
    } catch (e) {
      debugPrint('Failed to get reminders by category: $e');
      return [];
    }
  }

  /// Get reminders by date range
  List<Reminder> getRemindersByDateRange(DateTime startDate, DateTime endDate) {
    try {
      final box = _hiveService.reminders;
      return box.values
          .cast<HiveReminder>()
          .map((hiveReminder) => hiveReminder.toReminder())
          .where((reminder) =>
              reminder.finalDate.isAfter(startDate) &&
              reminder.finalDate.isBefore(endDate))
          .toList();
    } catch (e) {
      debugPrint('Failed to get reminders by date range: $e');
      return [];
    }
  }

  /// Get pending reminders
  List<Reminder> getPendingReminders() {
    return getRemindersByStatus(ReminderStatus.pending);
  }

  /// Get completed reminders
  List<Reminder> getCompletedReminders() {
    return getRemindersByStatus(ReminderStatus.completed);
  }

  /// Get overdue reminders
  List<Reminder> getOverdueReminders() {
    try {
      final now = DateTime.now();
      final allReminders = getAllReminders();
      return allReminders.where((reminder) =>
          reminder.finalDate.isBefore(now) &&
          reminder.status != ReminderStatus.completed).toList();
    } catch (e) {
      debugPrint('Failed to get overdue reminders: $e');
      return [];
    }
  }

  /// Mark reminder as completed
  Future<void> markAsCompleted(String reminderId) async {
    try {
      final reminder = getReminder(reminderId);
      if (reminder != null) {
        final updatedReminder = reminder.copyWith(
          status: ReminderStatus.completed,
          isChecked: true,
        );
        await updateReminder(updatedReminder);
      }
    } catch (e) {
      debugPrint('Failed to mark reminder as completed: $e');
      rethrow;
    }
  }

  /// Update reminder status based on date
  Future<void> updateReminderStatuses() async {
    try {
      final now = DateTime.now();
      final pendingReminders = getPendingReminders();
      
      for (final reminder in pendingReminders) {
        if (reminder.finalDate.isBefore(now)) {
          final updatedReminder = reminder.copyWith(
            status: ReminderStatus.overdue,
          );
          await updateReminder(updatedReminder);
        }
      }
    } catch (e) {
      debugPrint('Failed to update reminder statuses: $e');
    }
  }

  /// Search reminders by title or description
  List<Reminder> searchReminders(String query) {
    try {
      final box = _hiveService.reminders;
      final lowerQuery = query.toLowerCase();
      return box.values
          .cast<HiveReminder>()
          .map((hiveReminder) => hiveReminder.toReminder())
          .where((reminder) =>
              reminder.title.toLowerCase().contains(lowerQuery) ||
              (reminder.description?.toLowerCase().contains(lowerQuery) ?? false))
          .toList();
    } catch (e) {
      debugPrint('Failed to search reminders: $e');
      return [];
    }
  }

  /// Clear all reminders
  Future<void> clearAllReminders() async {
    try {
      final box = _hiveService.reminders;
      await box.clear();
      debugPrint('All reminders cleared');
    } catch (e) {
      debugPrint('Failed to clear all reminders: $e');
      rethrow;
    }
  }
}
