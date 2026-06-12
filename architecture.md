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
│   │   ├── device_util.dart
│   │   └── resizer/        # Responsive design utilities
│   │       ├── constant.dart
│   │       ├── fetch_pixels.dart
│   │       └── widget_utils.dart
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
│   │   ├── app/           # Main app screens
│   │   │   ├── analytics/
│   │   │   ├── dashboard/
│   │   │   ├── overview/
│   │   │   ├── profile/
│   │   │   ├── other_screens/
│   │   │   ├── provider/   # State management providers
│   │   │   └── widgets/    # Reusable app widgets
│   │   ├── auth/          # Authentication screens
│   │   ├── widgets/       # Reusable screen widgets
│   │   └── app_view.dart
│   ├── services/          # Business logic and external services
│   ├── utils/             # Utility functions and helpers
│   ├── widgets/           # Global reusable widgets
│   └── main.dart          # App entry point
├── assets/                # Static assets
│   ├── fonts/            # Custom fonts (Inter family)
│   ├── icons/            # SVG icons
│   └── images/           # App images and illustrations
├── test/                  # Test files
├── .gitignore             # Git ignore patterns
├── .windsurfignore        # Windsurf/IDE ignore patterns
├── .windsurfrules         # Windsurf/IDE rules (currently empty)
├── pubspec.yaml           # Flutter dependencies and configuration
└── README.md              # Project documentation
```

---

## Architecture Patterns

### State Management
The application uses the **Provider pattern** for state management:
- **AuthProvider**: Manages authentication state and user sessions
- **AppProvider**: Manages app-level state (e.g., current page index, navigation)
- Providers are initialized in `main.dart` using `MultiProvider`

### Navigation
- Uses named routes defined in `utils/routes.dart`
- Initial route: `Routes.splash`
- Navigation managed through `MaterialApp` routes

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
- **Feature-based structure**: Screens organized by feature (analytics, dashboard, profile, etc.)
- **Separation of concerns**: Models, resources, screens, and utilities are separated
- **Provider pattern**: State management isolated in provider classes
- **Reusable components**: Common widgets in dedicated widgets directories

### Naming Conventions
- **Files**: snake_case (e.g., `account_details_view.dart`)
- **Classes**: PascalCase (e.g., `AppProvider`, `MyApp`)
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
- **Splash**: App launch screen
- **Auth**: Authentication flows (login, signup, etc.)
- **Dashboard**: Main dashboard view
- **Overview**: Financial overview
- **Analytics**: Detailed analytics and charts
- **Profile**: User profile management
- **Settings**: App settings and preferences

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
- **Last Updated**: June 2026

---

## Contact and Support

For questions or issues related to the architecture, refer to the project README or contact the development team.
