# Post Pagination App

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Flutter application demonstrating pagination implementation for posts, albums, and photos. Built with BLoC pattern for
state management and featuring a custom pagination service package.

## Prerequisites

Before getting started, make sure you have the following installed:

- **Flutter SDK**: >=3.10.0 <4.0.0
- **Dart SDK**: >=3.10.0 <4.0.0
- **IDE**: VSCode or Android Studio with Flutter extensions
- **Platforms**:
    - For iOS: Xcode (macOS only)
    - For Android: Android Studio or Android SDK
    - For Web: Google Chrome
    - For Windows: Visual Studio 2019 or later

## Initial Setup

### 1. Clone the repository

```bash
git clone <repository-url>
cd post_pagination_app
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure API endpoint

This project uses [JSONPlaceholder](https://jsonplaceholder.typicode.com/) as a fake REST API for testing and
prototyping.

#### Create configuration file

Create an `api-keys.json` file in the project's root directory with the following structure:

```json
{
  "BASE_API_URL": "https://jsonplaceholder.typicode.com/"
}
```

**Important**: Add `api-keys.json` to `.gitignore` if you plan to use a different API endpoint in production.

### 4. Configure bundle identifiers (Optional)

If you want to rename the bundle identifiers for each platform:

#### Android

- Edit `android/app/build.gradle`
- Change the `applicationId` value

#### iOS

- Open `ios/Runner.xcworkspace` in Xcode
- Select `Runner` target
- Change the `Bundle Identifier` in the General tab

### 5. Generate localization files

The project supports multiple languages (English and Spanish). Generate the localization files:

```bash
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Translation files are located at:

- `lib/l10n/arb/app_en.arb` (English)
- `lib/l10n/arb/app_es.arb` (Spanish)

## Development

### Available Flavors

This project contains 3 flavors for different environments:

- **development**: For local development and testing
- **staging**: For pre-production testing
- **production**: For production releases

### Run in development mode

#### Using VSCode/Android Studio

Use the launch configuration in your IDE to select the desired flavor.

#### Using command line

```bash
# Development
flutter run --flavor development --target lib/main_development.dart --dart-define-from-file=api-keys.json

# Staging
flutter run --flavor staging --target lib/main_staging.dart --dart-define-from-file=api-keys.json

# Production
flutter run --flavor production --target lib/main_production.dart --dart-define-from-file=api-keys.json
```

### Run on specific platforms

```bash
# iOS
flutter run --flavor development --target lib/main_development.dart --dart-define-from-file=api-keys.json -d iPhone

# Android
flutter run --flavor development --target lib/main_development.dart --dart-define-from-file=api-keys.json -d android

# Web
flutter run --flavor development --target lib/main_development.dart --dart-define-from-file=api-keys.json -d chrome

# Windows
flutter run --flavor development --target lib/main_development.dart --dart-define-from-file=api-keys.json -d windows
```

### Build for production

```bash
# iOS
flutter build ios --flavor production --target lib/main_production.dart --dart-define-from-file=api-keys.json

# Android (App Bundle)
flutter build appbundle --flavor production --target lib/main_production.dart --dart-define-from-file=api-keys.json

# Android (APK)
flutter build apk --flavor production --target lib/main_production.dart --dart-define-from-file=api-keys.json

# Web
flutter build web --target lib/main_production.dart --dart-define-from-file=api-keys.json

# Windows
flutter build windows --target lib/main_production.dart --dart-define-from-file=api-keys.json
```

## Project Structure

```
lib/
├── l10n/                    # Localization files
│   ├── arb/                # .arb files for translations
│   └── gen/                # Generated localization files
├── app/                    # App initialization and configuration
│   ├── dependencies/      # Dependency injection setup
│   ├── router/            # Go Router configuration
│   ├── view/              # Main app view
│   └── widgets/           # Shared app widgets
└── features/              # Feature modules
    ├── albums/            # Albums listing with pagination
    ├── photos/            # Photos listing with pagination
    └── posts/             # Posts listing with pagination
packages/
└── pagination_service/    # Custom pagination service package
    ├── lib/              # Package source code
    └── test/             # Package tests
```

## Features

### Posts

- Browse paginated list of posts
- Infinite scroll pagination
- Pull to refresh
- Loading states and error handling
- Empty state handling

### Albums

- Browse paginated list of albums
- Infinite scroll pagination
- Pull to refresh
- Loading states and error handling
- Empty state handling

### Photos

- Browse paginated list of photos
- Infinite scroll pagination
- Pull to refresh
- Loading states and error handling
- Empty state handling
- Optimized image loading

### Pagination Service Package

This project includes a custom `pagination_service` package that provides:

- Generic pagination logic
- Page-based and cursor-based pagination support
- Built-in error handling
- Retry mechanisms
- State management integration

## Localization (l10n)

### Add new translations

1. Edit the `.arb` files in `lib/l10n/arb/`:
    - `app_en.arb` for English
    - `app_es.arb` for Spanish

2. Add new key/value pairs:
   ```json
   {
     "@@locale": "en",
     "newKey": "New translation",
     "@newKey": {
       "description": "Description of the new key"
     }
   }
   ```

3. Regenerate localization files:
   ```bash
   flutter gen-l10n --arb-dir="lib/l10n/arb"
   ```

4. Use the new string in your code:
   ```dart
   import 'package:post_pagination_app/l10n/l10n.dart';

   @override
   Widget build(BuildContext context) {
     final l10n = context.l10n;
     return Text(l10n.newKey);
   }
   ```

### Add new language

1. Create a new `.arb` file in `lib/l10n/arb/`:
   ```
   app_fr.arb  # For French
   ```

2. Update iOS localization in `ios/Runner/Info.plist`:
   ```xml
   <key>CFBundleLocalizations</key>
   <array>
     <string>en</string>
     <string>es</string>
     <string>fr</string>
   </array>
   ```

3. Regenerate localization files

## Testing

### Run all tests

```bash
flutter test
```

### Run tests with coverage

```bash
flutter test --coverage --test-randomize-ordering-seed random
```

### View coverage report

```bash
# Generate coverage report
genhtml coverage/lcov.info -o coverage/

# Open coverage report in browser
open coverage/index.html
```

### Run specific test file

```bash
flutter test test/path/to/test_file.dart
```

### Run pagination_service package tests

```bash
cd packages/pagination_service
flutter test --coverage
```

## Code Quality

### Run code analysis

The project uses `very_good_analysis` to maintain code quality:

```bash
flutter analyze
```

### Format code

```bash
flutter format .
```

### Run all checks

```bash
# Format, analyze, and test
flutter format .
flutter analyze
flutter test
```

## Main Dependencies

### State Management & Architecture

- **flutter_bloc**: BLoC pattern implementation
- **bloc**: Core BLoC library
- **equatable**: Value equality for BLoC states

### Networking & Data

- **dio**: HTTP client for API calls
- **pagination_service**: Custom pagination logic (local package)

### Dependency Injection

- **get_it**: Service locator for dependency injection

### Navigation

- **go_router**: Declarative routing

### UI Components

- **flutter_hooks**: React-like hooks for Flutter
- **gap**: Spacing widgets

### Localization

- **flutter_localizations**: Internationalization support
- **intl**: Internationalization and localization utilities

### Dev Dependencies

- **bloc_test**: Testing utilities for BLoC
- **mocktail**: Mocking library for tests
- **very_good_analysis**: Strict lint rules

## API Documentation

This project uses the JSONPlaceholder API:

- **Base URL**: `https://jsonplaceholder.typicode.com/`
- **API Documentation**: [JSONPlaceholder Guide](https://jsonplaceholder.typicode.com/guide/)

### Endpoints used:

- `/posts` - Get paginated posts
- `/albums` - Get paginated albums
- `/photos` - Get paginated photos

## Pagination Implementation

The app demonstrates two pagination approaches:

### Page-based Pagination

- Used for posts and albums
- Loads data in discrete pages (page 1, 2, 3...)
- Supports direct page jumping
- Easier to implement caching

### Infinite Scroll

- Continuous scrolling experience
- Automatically loads more items as user scrolls
- Shows loading indicator at bottom
- Handles end of list gracefully

## Troubleshooting

### Error: "Flutter SDK not found"

Verify that Flutter is installed correctly and in your PATH:

```bash
flutter doctor
```

### api-keys.json not found

Ensure you have created the `api-keys.json` file in the root directory with the BASE_API_URL.

### Flavor not found error

Make sure you're specifying both the flavor and target:

```bash
flutter run --flavor development --target lib/main_development.dart --dart-define-from-file=api-keys.json
```

### API request errors

- Check your internet connection
- Verify BASE_API_URL in `api-keys.json` is correct
- Ensure JSONPlaceholder API is accessible

### l10n generation error

Regenerate localization files:

```bash
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

### Pagination service not found

Make sure you've run `flutter pub get` in both the root and the package:

```bash
flutter pub get
cd packages/pagination_service
flutter pub get
cd ../..
```

### iOS build fails

Clean and rebuild:

```bash
flutter clean
cd ios
pod install
cd ..
flutter build ios --flavor development --target lib/main_development.dart --dart-define-from-file=api-keys.json
```

### Android build fails

Clean project:

```bash
flutter clean
cd android
./gradlew clean
cd ..
flutter build apk --flavor development --target lib/main_development.dart --dart-define-from-file=api-keys.json
```

### Tests failing

Run tests with verbose output:

```bash
flutter test --reporter=expanded
```

### BLoC state not updating

- Check if events are being added to the bloc
- Verify state equality with Equatable
- Use BlocObserver for debugging
- Check for proper bloc disposal

## Performance Optimization

This app implements several performance optimizations:

- **Lazy Loading**: Items are loaded on demand as user scrolls
- **State Caching**: BLoC maintains loaded items to avoid refetching
- **Efficient Widgets**: Uses const constructors where possible
- **Image Optimization**: Lazy loads images in photo list
- **Debouncing**: Prevents excessive API calls during rapid scrolling

## Architecture

### BLoC Pattern

The app follows the BLoC (Business Logic Component) pattern:

- **UI**: Widgets that display data and emit events
- **BLoC**: Business logic that processes events and emits states
- **Repository**: Data layer that communicates with API
- **Service**: Reusable pagination logic in separate package

### Dependency Injection

Uses GetIt for service location:

- Singleton services registered at app startup
- Lazy initialization of dependencies
- Easy testing with mock implementations

## Contributing

1. Create a branch from `main`
2. Make your changes
3. Run tests: `flutter test`
4. Run analysis: `flutter analyze`
5. Format code: `flutter format .`
6. Create a Pull Request to `main`

## Testing Strategy

### Unit Tests

- BLoC event/state testing
- Repository method testing
- Pagination service logic testing

### Widget Tests

- Widget rendering tests
- User interaction tests
- State change verification

### Integration Tests

- End-to-end pagination flow
- Navigation testing
- API integration testing

## Future Enhancements

Potential features for future versions:

- Search functionality
- Filtering and sorting options
- Offline mode with local caching
- Post details view
- Album details with photos
- User profile integration
- Favorites/bookmarks
- Share functionality
- Dark mode support
- Advanced error recovery

## License

This project is licensed under the MIT License - see the [LICENSE](https://opensource.org/licenses/MIT) for details.

---

Generated by the [Very Good CLI][very_good_cli_link] 🤖

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
