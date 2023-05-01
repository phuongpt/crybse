# Crybse

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

The project is a mobile application built with Flutter that serves as a platform to follow cryto market. It uses RiverPod as the state management and apply clean architecture. The project uses Supabase to communicate with the backend.

And [Product Hunt](https://github.com/phuongpt/product_hunt) is another project which uses BloC and GraphQL


---
## Showcase

https://user-images.githubusercontent.com/4443583/235393820-8991451c-7436-44a0-b2d7-1d8bf7facb83.mp4
   
<div style="display: flex; flex-direction">
  <img style="width: 18%;" src="https://github.com/phuongpt/crybse/blob/develop/docs/images/screen1.png" alt="Image description">
  <img style="width: 18%;" src="https://github.com/phuongpt/crybse/blob/develop/docs/images/screen2.png" alt="Image description">
  <img style="width: 18%;" src="https://github.com/phuongpt/crybse/blob/develop/docs/images/screen3.png" alt="Image description">
  <img style="width: 18%;" src="https://github.com/phuongpt/crybse/blob/develop/docs/images/screen4.png" alt="Image description">
  <img style="width: 18%;" src="https://github.com/phuongpt/crybse/blob/develop/docs/images/screen5.png" alt="Image description">
</div>


---

## Clean Architecture
The application uses Rivepod as the state management library, which follows clean architecture feature-first. 
The app has the following directory structure:

```sh
lib/
|-- app/
    |-- app
    |-- observers
    |-- providers
|-- features/
    |-- market/
        |-- data/
            |-- datasource/
            |-- models/
            |-- repository/
        |-- domain/
            |-- provider/
            |-- repository/
            |-- usecase/
        |-- presentation/
            |-- page/
            |-- provider/
            |-- widget/
    |-- auth/...
    |-- favorite/...
    |-- search/...
    |-- settings/...
|-- shared/
    |-- core/
        |-- constants/
        |-- extenstions/
        |-- helper/
        |-- validators/
    |-- domain/
    |-- providers/
|-- routers/
main.dart

```


## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Crybse works on iOS, Android, Web, and Windows._

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---


[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
