import 'package:expenzo/screens/app/app_view.dart';
import 'package:expenzo/screens/app/other_screens/account_settings_view.dart';
import 'package:expenzo/screens/app/other_screens/add_expense_screen.dart';
import 'package:expenzo/screens/app/other_screens/add_reminder_view.dart';
import 'package:expenzo/screens/app/other_screens/edit_profile_view.dart';
import 'package:expenzo/screens/app/profile/account_details_view.dart';
import 'package:expenzo/screens/app/profile/personal_info_view.dart';
import 'package:expenzo/screens/app/other_screens/budget_details_view.dart';
import 'package:expenzo/screens/app/other_screens/expense_details_view.dart';
import 'package:expenzo/screens/app/other_screens/expense_history_view.dart';
import 'package:expenzo/screens/app/other_screens/faqs_screen.dart';
import 'package:expenzo/screens/app/other_screens/notifications_view.dart';
import 'package:expenzo/screens/app/other_screens/reminder_detail_view.dart';
import 'package:expenzo/screens/app/other_screens/reminder_view.dart';
import 'package:expenzo/screens/app/other_screens/settings_view.dart';
import 'package:expenzo/screens/app/other_screens/transaction_detail_view.dart';
import 'package:expenzo/screens/app/other_screens/transactions_history_view.dart';
import 'package:expenzo/screens/auth/Sign up/sign_up.dart';
import 'package:expenzo/screens/auth/app_starter/opener.dart';
import 'package:expenzo/screens/auth/app_starter/splash.dart';
import 'package:expenzo/screens/auth/initialize/initial_details.dart';
import 'package:expenzo/screens/auth/initialize/welcome.dart';
import 'package:expenzo/screens/auth/password_forget/enter_new_password.dart';
import 'package:expenzo/screens/auth/password_forget/forget_password_email.dart';
import 'package:expenzo/screens/auth/sign in/sign_in.dart';
import 'package:expenzo/screens/widgets/set_budget.dart';
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
      Routes.splash: (context) => const SplashScreen(),
      Routes.opener: (context) => const FirstOpener(),
      Routes.signIn: (context) => const SignIn(),
      Routes.signUp: (context) => const SignUp(),

      Routes.welcome: (context) => const Welcome(),
      Routes.initialDetails: (context) => const InitialDetails(),
      Routes.setBudget: (context) => const SetBudget(),
      Routes.forgetPasswordEmail: (context) => const ForgetPasswordEmail(),
      Routes.enterNewPassword: (context) => const EnterNewPassword(),

      // App view
      Routes.appView: (context) => const AppView(),

      // Expense screens
      Routes.addExpense: (context) => const AddExpenseScreen(),
      Routes.expenseHistory: (context) => const ExpenseHistoryView(),
      Routes.expenseDetails: (context) => const ExpenseDetailsView(),

      // Transaction screens
      Routes.transactionHistory: (context) => const TransactionHistoryView(),
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
      Routes.faqs: (context) => const FAQsScreen(),
    };
  }

  static void navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  static void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
