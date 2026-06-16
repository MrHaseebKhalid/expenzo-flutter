import 'package:expenzo/screens/main_app/app_view.dart';
import 'package:expenzo/screens/main_app/settings/account_settings_view.dart';
import 'package:expenzo/screens/main_app/expenses/add_expense_view.dart';
import 'package:expenzo/screens/main_app/reminders/add_reminder_view.dart';
import 'package:expenzo/screens/main_app/profile/edit_profile_view.dart';
import 'package:expenzo/screens/main_app/profile/account_details_view.dart';
import 'package:expenzo/screens/main_app/profile/personal_info_view.dart';
import 'package:expenzo/screens/main_app/budget/budget_details_view.dart';
import 'package:expenzo/screens/main_app/expenses/expense_details_view.dart';
import 'package:expenzo/screens/main_app/expenses/expense_history_view.dart';
import 'package:expenzo/screens/main_app/settings/faqs_view.dart';
import 'package:expenzo/screens/main_app/settings/notifications_view.dart';
import 'package:expenzo/screens/main_app/reminders/reminder_detail_view.dart';
import 'package:expenzo/screens/main_app/reminders/reminder_view.dart';
import 'package:expenzo/screens/main_app/settings/settings_view.dart';
import 'package:expenzo/screens/main_app/transactions/transaction_detail_view.dart';
import 'package:expenzo/screens/main_app/transactions/transactions_history_view.dart';
import 'package:expenzo/screens/auth/sign_up/sign_up_view.dart';
import 'package:expenzo/screens/auth/app_starter/opener_view.dart';
import 'package:expenzo/screens/auth/app_starter/splash_view.dart';
import 'package:expenzo/screens/auth/onboarding/initial_details_view.dart';
import 'package:expenzo/screens/auth/onboarding/welcome_view.dart';
import 'package:expenzo/screens/auth/password_reset/enter_new_password_view.dart';
import 'package:expenzo/screens/auth/password_reset/forget_password_email_view.dart';
import 'package:expenzo/screens/auth/sign_in/sign_in_view.dart';
import 'package:expenzo/screens/shared/widgets/set_budget_view.dart';
import 'package:flutter/material.dart';

class Routes {
  // Auth screens
  static const String splash = '/splash';
  static const String opener = '/opener';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String forgetPasswordEmail = '/forget-password-email';
  static const String enterNewPassword = '/enter-new-password';
  static const String verification = '/verification';
  static const String confirmation = '/confirmation';
  static const String welcome = '/welcome';
  static const String initialDetails = '/initial-details';
  static const String setBudget = '/set-budget';

  // Main screens
  static const String appView = '/appView';
  // static const String analytics = '/analytics';
  // static const String overview = '/overview';
  // static const String profile = '/profile';

  // Expense screens
  static const String addExpense = '/add-expense';
  static const String expenseHistory = '/expense-history';
  static const String expenseDetails = '/expense-details';

  // Transaction screens
  static const String transactionHistory = '/transaction-history';
  static const String transactionDetails = '/transaction-details';

  // Budget screens
  static const String budgetDetails = '/budget-details';

  // Reminder screens
  static const String reminders = '/reminders';
  static const String reminderDetails = '/reminder-details';
  static const String addReminder = '/add-reminder';

  // Settings screens
  static const String settings = '/settings';
  static const String accountSettings = '/account-settings';
  static const String editProfile = '/edit-profile';
  static const String personalInfo = '/personal-info';
  static const String accountDetails = '/account-details';
  static const String notifications = '/notifications';
  static const String faqs = '/faqs';
}

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      // Auth screens
      Routes.splash: (context) => const SplashView(),
      Routes.opener: (context) => const OpenerView(),
      Routes.signIn: (context) => const SignInView(),
      Routes.signUp: (context) => const SignUpView(),

      Routes.welcome: (context) => const WelcomeView(),
      Routes.initialDetails: (context) => const InitialDetailsView(),
      Routes.setBudget: (context) => const SetBudgetView(),
      Routes.forgetPasswordEmail: (context) => const ForgetPasswordEmailView(),
      Routes.enterNewPassword: (context) => const EnterNewPasswordView(),

      // App view
      Routes.appView: (context) => const AppView(),

      // Expense screens
      Routes.addExpense: (context) => const AddExpenseView(),
      Routes.expenseHistory: (context) => const ExpenseHistoryView(),
      Routes.expenseDetails: (context) => const ExpenseDetailsView(),

      // Transaction screens
      Routes.transactionHistory: (context) => const TransactionsHistoryView(),
      Routes.transactionDetails: (context) => const TransactionDetailView(),

      // Budget screens
      Routes.budgetDetails: (context) => const BudgetDetailsView(),

      // Reminder screens
      Routes.reminders: (context) => const ReminderView(),
      Routes.reminderDetails: (context) => const ReminderDetailView(),
      Routes.addReminder: (context) => const AddReminderView(),

      // Settings screens
      Routes.settings: (context) => const SettingsView(),
      Routes.accountSettings: (context) => const AccountSettingsView(),
      Routes.editProfile: (context) => const EditProfileView(),
      Routes.personalInfo: (context) => const PersonalInfoView(),
      Routes.accountDetails: (context) => const AccountDetailsView(),
      Routes.notifications: (context) => const NotificationsView(),

      // Other screens
      Routes.faqs: (context) => const FAQsView(),
    };
  }

  static void navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
