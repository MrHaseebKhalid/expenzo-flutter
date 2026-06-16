# Expenzo Architecture Documentation

## Project Overview

**Expenzo** is a Flutter-based expense tracking application designed to help users manage their personal finances efficiently. The app follows a clean architecture pattern with separation of concerns, utilizing Provider for state management and Material Design for UI components.

### Tech Stack
- **Framework**: Flutter (SDK ^3.9.0)
- **Language**: Dart
- **State Management**: Provider (^6.1.5+1)
- **UI Components**: Material Design, Cupertino Icons
- **Charts**: FL Chart (^0.70.2), Syncfusion Flutter Charts (^28.1.33)
- **Navigation**: Curved Navigation Bar (^1.0.6)
- **Input**: Pinput (^6.0.1)
- **Icons**: Flutter SVG (^2.2.3)
- **Borders**: Dotted Border (^3.1.0)

---

## Project Structure

```
expenzo/
├── android/                 # Android-specific configuration and build files
├── ios/                     # iOS-specific configuration and build files
├── lib/                     # Main application source code
│   ├── base/               # Base utilities and device-specific code
│   │   ├── constant.dart
│   │   ├── widget_utils.dart
│   │   └── resizer/        # Responsive design utilities
│   │       ├── fetch_pixels.dart
│   │       └── device_util.dart
│   ├── data/               # Data layer and repositories
│   │   └── expense_data.dart
│   ├── models/             # Data models
│   │   ├── analytics.dart
│   │   ├── app_settings.dart
│   │   ├── budget.dart
│   │   ├── category.dart
│   │   ├── expense.dart
│   │   ├── filter.dart
│   │   ├── monthly_comparison.dart
│   │   ├── notification_settings.dart
│   │   ├── reminder.dart
│   │   ├── transaction.dart
│   │   └── user.dart
│   ├── provider/           # State management providers
│   │   ├── app_provider.dart
│   │   └── auth_provider.dart
│   ├── resources/          # App resources (colors, themes, strings, etc.)
│   │   ├── colors.dart
│   │   ├── decoration.dart
│   │   ├── dummy_text.dart
│   │   ├── icons.dart
│   │   ├── images.dart
│   │   ├── resources.dart
│   │   ├── strings.dart
│   │   ├── text_style.dart
│   │   └── themes.dart
│   ├── screens/            # UI screens and views
│   │   ├── auth/          # Authentication screens
│   │   │   ├── app_starter/
│   │   │   │   ├── splash_view.dart
│   │   │   │   └── opener_view.dart
│   │   │   ├── onboarding/
│   │   │   │   ├── initial_details_view.dart
│   │   │   │   └── welcome_view.dart
│   │   │   ├── password_reset/
│   │   │   │   ├── enter_new_password_view.dart
│   │   │   │   └── forget_password_email_view.dart
│   │   │   ├── sign_in/
│   │   │   │   └── sign_in_view.dart
│   │   │   ├── sign_up/
│   │   │   │   └── sign_up_view.dart
│   │   │   └── widgets/
│   │   │       ├── confirmation.dart
│   │   │       └── verification.dart
│   │   ├── main_app/      # Main application screens
│   │   │   ├── analytics/
│   │   │   │   └── analytics_view.dart
│   │   │   ├── budget/
│   │   │   │   └── budget_details_view.dart
│   │   │   ├── dashboard/
│   │   │   │   └── dashboard_view.dart
│   │   │   ├── expenses/
│   │   │   │   ├── add_expense_view.dart
│   │   │   │   ├── expense_details_view.dart
│   │   │   │   └── expense_history_view.dart
│   │   │   ├── home/
│   │   │   │   ├── overview_view.dart
│   │   │   │   └── widgets/
│   │   │   │       ├── donut_chart/
│   │   │   │       │   ├── donut_chart_config.dart
│   │   │   │       │   ├── donut_segment.dart
│   │   │   │       │   ├── donut_segment_path_builder.dart
│   │   │   │       │   ├── expense_donut_chart.dart
│   │   │   │       │   └── expense_donut_chart_painter.dart
│   │   │   │       └── donut_chart_pill.dart
│   │   │   ├── profile/
│   │   │   │   ├── account_details_view.dart
│   │   │   │   ├── edit_profile_view.dart
│   │   │   │   ├── personal_info_view.dart
│   │   │   │   └── profile_view.dart
│   │   │   ├── reminders/
│   │   │   │   ├── add_reminder_view.dart
│   │   │   │   ├── reminder_detail_view.dart
│   │   │   │   └── reminder_view.dart
│   │   │   ├── settings/
│   │   │   │   ├── account_settings_view.dart
│   │   │   │   ├── faqs_view.dart
│   │   │   │   ├── notifications_view.dart
│   │   │   │   └── settings_view.dart
│   │   │   ├── transactions/
│   │   │   │   ├── transaction_detail_view.dart
│   │   │   │   └── transactions_history_view.dart
│   │   │   ├── widgets/
│   │   │   │   ├── bottom_app_bar.dart
│   │   │   │   ├── floating_action_button.dart
│   │   │   │   └── semi_circle.dart
│   │   │   └── app_view.dart
│   │   └── shared/        # Shared widgets across screens
│   │       └── widgets/
│   │           ├── set_budget_view.dart
│   │           └── sub_category_box.dart
│   ├── utils/             # Utility functions and helpers
│   │   └── routes.dart
│   ├── widgets/           # Global reusable widgets
│   │   ├── my_app_bar1.dart
│   │   ├── my_app_bar2.dart
│   │   ├── my_button.dart
│   │   ├── my_container.dart
│   │   └── my_text_field.dart
│   └── main.dart          # App entry point
├── assets/                # Static assets
│   ├── fonts/            # Custom fonts (Inter family)
│   ├── icons/            # SVG icons
│   └── images/           # App images and illustrations
├── test/                  # Test files
├── .gitignore             # Git ignore patterns
├── .windsurfignore        # Windsurf/IDE ignore patterns
├── .windsurfrules         # Windsurf/IDE rules
├── pubspec.yaml           # Flutter dependencies and configuration
└── README.md              # Project documentation
```

---

## Architecture Patterns

### State Management
The application uses the **Provider pattern** for state management:
- **AuthProvider** (lib/provider/auth_provider.dart): Manages authentication state and user sessions
- **AppProvider** (lib/provider/app_provider.dart): Manages app-level state (e.g., current page index, navigation)
- Providers are initialized in `main.dart` using `MultiProvider`

### Navigation
- Uses named routes defined in `utils/routes.dart`
- Initial route: `Routes.splash`
- Navigation managed through `MaterialApp` routes
- Authentication routes: splash, opener, signIn, signUp, forgetPasswordEmail, enterNewPassword, initialDetails, welcome
- Main app routes: overview, dashboard, analytics, profile, and various feature-specific routes

### Responsive Design
- Custom resizer utilities in `base/resizer/` for responsive UI
- Device-specific utilities in `base/device_util.dart`
- Pixel-based scaling for consistent UI across devices

### Theme Management
- Light and dark theme support
- Themes defined in `resources/themes.dart`
- Material Design 3 components
- Custom color palette in `resources/colors.dart`

---

## Dependency Management

### Core Dependencies
- **flutter**: SDK framework
- **cupertino_icons**: iOS-style icons
- **provider**: State management solution

### UI/UX Dependencies
- **flutter_svg**: SVG rendering for icons
- **curved_navigation_bar**: Custom bottom navigation
- **pinput**: PIN input widget
- **dotted_border**: Dotted border decoration

### Data Visualization
- **fl_chart**: Modern charting library
- **syncfusion_flutter_charts**: Advanced charting components

### Development Dependencies
- **flutter_test**: Testing framework
- **flutter_lints**: Code quality and style linting

---

## Asset Organization

### Fonts
- **Font Family**: Inter
- **Weights**: Regular (400), Medium (500), SemiBold (600), Bold (700)
- **Location**: `assets/fonts/`

### Icons
- **Format**: SVG
- **Location**: `assets/icons/`
- **Usage**: Rendered via flutter_svg

### Images
- **Format**: PNG
- **Location**: `assets/images/`
- **Content**: App logo, onboarding illustrations, UI images

---

## Build and Ignore Patterns

### .windsurfignore Patterns
The following patterns are excluded from Windsurf/IDE indexing:

#### Dependency Directories
- `node_modules/` - Node.js dependencies
- `vendor/` - Third-party vendor code
- `.pnp/` - Plug'n'Play dependencies

#### Build Artifacts
- `dist/` - Distribution builds
- `build/` - Build outputs
- `out/` - Output directories
- `.next/` - Next.js build cache
- `.nuxt/` - Nuxt.js build cache
- `.cache/` - Cache directories
- `*.log` - Log files

#### Sensitive Information
- `.env` - Environment variables
- `.env.*` - Environment file variants

#### Large Assets
- `public/assets/` - Public asset directories
- `public/images/` - Public image directories

### .gitignore Patterns
Standard Flutter gitignore patterns for:
- Build artifacts
- IDE configurations
- OS-specific files
- Dependency caches

---

## Coding Standards and Conventions

### File Organization
- **Feature-based structure**: Screens organized by feature (auth, main_app with sub-features like analytics, dashboard, profile, etc.)
- **Separation of concerns**: Models, resources, screens, providers, and utilities are separated
- **Provider pattern**: State management isolated in lib/provider/ directory
- **Reusable components**: Common widgets in dedicated widgets directories (global widgets in lib/widgets/, feature-specific in screens/*/widgets/)
- **Data layer**: Data repositories in lib/data/
- **Shared widgets**: Cross-screen reusable widgets in screens/shared/widgets/

### Naming Conventions
- **Files**: snake_case with _view.dart suffix for screens (e.g., `account_details_view.dart`, `dashboard_view.dart`)
- **Classes**: PascalCase matching file names (e.g., `AccountDetailsView`, `DashboardView`)
- **Variables/Methods**: camelCase (e.g., `currentPageIndex`, `update()`)
- **Constants**: UPPER_SNAKE_CASE (inferred from pattern)

### Import Organization
- Group imports logically (framework, packages, local files)
- Use relative imports for local files
- Keep imports sorted and organized

### Resource Management
- Centralized resource management via `resources.dart`
- Consistent theming through `themes.dart`
- String constants in `strings.dart`
- Icon references in `icons.dart`

---

## Key Components

### Main Application Entry
- **File**: `lib/main.dart`
- **Responsibilities**: App initialization, provider setup, theme configuration, route setup

### Providers
- **AuthProvider**: Authentication state and user management
- **AppProvider**: App navigation and UI state

### Models
- **User**: User profile and account information
- **Expense**: Expense tracking data
- **Budget**: Budget management
- **Transaction**: Transaction records
- **Analytics**: Analytics and reporting data
- **Category**: Expense categories
- **Reminder**: Reminder notifications
- **Filter**: Filtering options for data views

### Screens
**Authentication (screens/auth/)**
- **SplashView**: App launch screen (app_starter/splash_view.dart)
- **OpenerView**: Onboarding introduction (app_starter/opener_view.dart)
- **SignInView**: User login screen (sign_in/sign_in_view.dart)
- **SignUpView**: User registration screen (sign_up/sign_up_view.dart)
- **InitialDetailsView**: Initial user details collection (onboarding/initial_details_view.dart)
- **WelcomeView**: Welcome screen (onboarding/welcome_view.dart)
- **ForgetPasswordEmailView**: Password reset email input (password_reset/forget_password_email_view.dart)
- **EnterNewPasswordView**: New password entry (password_reset/enter_new_password_view.dart)

**Main App (screens/main_app/)**
- **AppView**: Main app container with bottom navigation (app_view.dart)
- **OverviewView**: Financial overview with donut chart (home/overview_view.dart)
- **DashboardView**: Main dashboard view (dashboard/dashboard_view.dart)
- **AnalyticsView**: Detailed analytics and charts (analytics/analytics_view.dart)
- **ProfileView**: User profile management (profile/profile_view.dart)
- **AccountDetailsView**: Account details screen (profile/account_details_view.dart)
- **EditProfileView**: Profile editing screen (profile/edit_profile_view.dart)
- **PersonalInfoView**: Personal information screen (profile/personal_info_view.dart)
- **SettingsView**: App settings and preferences (settings/settings_view.dart)
- **AccountSettingsView**: Account-specific settings (settings/account_settings_view.dart)
- **FAQsView**: Frequently asked questions (settings/faqs_view.dart)
- **NotificationsView**: Notification settings (settings/notifications_view.dart)
- **AddExpenseView**: Add new expense (expenses/add_expense_view.dart)
- **ExpenseDetailsView**: Expense details (expenses/expense_details_view.dart)
- **ExpenseHistoryView**: Expense history (expenses/expense_history_view.dart)
- **BudgetDetailsView**: Budget details (budget/budget_details_view.dart)
- **TransactionsHistoryView**: Transaction history (transactions/transactions_history_view.dart)
- **TransactionDetailView**: Transaction details (transactions/transaction_detail_view.dart)
- **ReminderView**: Reminders list (reminders/reminder_view.dart)
- **AddReminderView**: Add new reminder (reminders/add_reminder_view.dart)
- **ReminderDetailView**: Reminder details (reminders/reminder_detail_view.dart)

**Shared (screens/shared/)**
- **SetBudgetView**: Budget setup widget (shared/widgets/set_budget_view.dart)

---

## Development Workflow

### Running the App
```bash
flutter run
```

### Building for Production
```bash
# Android
flutter build apk

# iOS
flutter build ios
```

### Running Tests
```bash
flutter test
```

### Code Analysis
```bash
flutter analyze
```

### Dependency Management
```bash
# Get dependencies
flutter pub get

# Upgrade dependencies
flutter pub upgrade
```

---

## Best Practices

### State Management
- Use Provider for global state
- Keep providers focused and single-purpose
- Use `notifyListeners()` judiciously to avoid unnecessary rebuilds

### UI Development
- Follow Material Design guidelines
- Use responsive design utilities for cross-device compatibility
- Implement proper theme support (light/dark modes)

### Code Quality
- Follow Dart linting rules (flutter_lints)
- Write unit tests for business logic
- Keep functions small and focused
- Use meaningful variable and function names

### Performance
- Optimize widget rebuilds using const constructors
- Use lazy loading for large lists
- Implement proper disposal of resources
- Cache expensive computations

### Security
- Never commit sensitive data (API keys, secrets)
- Use environment variables for configuration
- Validate user inputs
- Implement proper authentication flows

---

## Future Enhancements

### Potential Improvements
- Add unit and integration tests
- Implement local storage (Hive, SQLite, or SharedPreferences)
- Add cloud sync capabilities
- Implement biometric authentication
- Add export functionality (CSV, PDF)
- Enhance analytics with more chart types
- Add budget alerts and notifications
- Implement multi-currency support

### Architecture Evolution
- Consider migrating to Riverpod for improved state management
- Implement repository pattern for data layer
- Add dependency injection
- Implement clean architecture layers more strictly
- Add BLoC/Cubit for complex state management scenarios

---

## Version Information

- **Current Version**: 1.0.0+1
- **Flutter SDK**: ^3.9.0
- **Last Updated**: June 14, 2026

---

## Contact and Support

For questions or issues related to the architecture, refer to the project README or contact the development team.
