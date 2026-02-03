# News App

A Flutter news application that fetches and displays headlines from multiple categories using the [NewsAPI](https://newsapi.org/). The app supports light/dark theme, English and Arabic localization, and a category-based browsing experience with multiple news sources per category.

## Features

- **Category-based news** — Browse news by category: General, Business, Sports, Technology, Entertainment, Health, and Science
- **Multiple sources per category** — Tab bar to switch between different news sources within a selected category
- **Light & dark theme** — Toggle between themes from the drawer; follows system preference by default
- **Localization (i18n)** — Full support for **English** and **Arabic** with Flutter’s `l10n` and ARB files
- **Drawer navigation** — Quick access to Home, theme switcher, and language selector
- **Responsive layout** — Adaptive UI using `MediaQuery` for different screen sizes
- **Error handling** — User-friendly error states and retry when API or network fails

## Tech Stack

| Area        | Technology / Package        |
|------------|-----------------------------|
| Framework  | Flutter (SDK ^3.8.1)        |
| State      | [Provider](https://pub.dev/packages/provider) |
| HTTP       | [http](https://pub.dev/packages/http)         |
| Fonts      | [google_fonts](https://pub.dev/packages/google_fonts) |
| Localization | `flutter_localizations`, `intl` |
| Splash     | [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) |

## Project Structure

```
lib/
├── apis/                    # API layer
│   ├── api_constants.dart   # Base URL and API key
│   ├── api_manager.dart     # HTTP calls (sources, news)
│   └── endpoints.dart       # API path constants
├── custom_widgets/          # Reusable UI components
│   └── custom_news_container.dart
├── l10n/                    # Localization (ARB + generated)
│   ├── app_ar.arb
│   ├── app_en.arb
│   └── app_localizations*.dart
├── models/                  # Data models
│   ├── NewsResponce.dart    # Articles, source, etc.
│   └── SourceResponce.dart  # News sources
├── providers/               # State management
│   ├── localization_provider.dart
│   └── theme_provider.dart
├── theme/                   # App themes
│   └── AppTheme.dart
├── ui/
│   ├── drawer/              # Drawer and dropdowns
│   │   ├── custom_drawer.dart
│   │   └── custom_drop_down_menu.dart
│   ├── home_screen/         # Home with categories
│   │   ├── category_list.dart
│   │   ├── custom_container_for_news_category.dart
│   │   ├── home_screen.dart
│   │   └── home_screen_view_model.dart
│   └── news_screen/         # News list and tabs
│       ├── news_list.dart
│       ├── news_screen_view_model.dart
│       ├── news_tab_bar.dart
│       └── NewsScreen.dart
├── utiles/                  # App-wide constants
│   ├── AppColors.dart
│   ├── AppFonts.dart
│   ├── AppImages.dart
│   └── AppRoutes.dart
└── main.dart
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (^3.8.1)
- Dart SDK ^3.8.1

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd news_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API key**  
   Get a free API key from [NewsAPI](https://newsapi.org/register).  
   Set it in `lib/apis/api_constants.dart`:
   ```dart
   class ApiConstants {
     static const String baseUrl = "newsapi.org";
     static const String apiKey = "YOUR_API_KEY_HERE";
   }
   ```

4. **Generate localizations** (if needed)
   ```bash
   flutter gen-l10n
   ```
   Or rely on `flutter pub get` with `generate: true` in `pubspec.yaml`.

5. **Run the app**
   ```bash
   flutter run
   ```

## Routes

| Route         | Screen     | Description                          |
|---------------|------------|--------------------------------------|
| `homeScreen`  | HomeScreen | Category grid; tap to open news      |
| `newsScreen`  | NewsScreen | Headlines for selected category + source tabs |

Navigation to `newsScreen` passes the category name as `arguments` (e.g. `"general"`, `"sports"`).

## Screens Overview

- **Home** — Greeting and category cards (with theme-aware images). Tapping a category loads sources and navigates to the news screen.
- **News** — App bar shows category; tab bar lists sources; list shows articles (title, description, image, etc.) from the selected source.

## Assets

- Images live under `assets/images/` and are referenced via `AppImages` in `lib/utiles/AppImages.dart`.
