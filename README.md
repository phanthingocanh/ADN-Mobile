# ADN Project

Assignment for Mobile Development (CO3043-192) course.

# Git

Follow [Git flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow).

**Do `Reformat Code` before commit**.

# Conventions
See https://dart.dev/guides/language/effective-dart/style

# Project Structure

See https://blog.codemagic.io/flutter-tutorial-organising-your-flutter-app/

```text
├── android
├── assets
├── ios
├── lib
│   ├── constants
│   ├── models
│   ├── screens
│   │   ├── screen1
│   │   │   └── screen1.dart
│   │   ├── screen2
│   │   └── ...
│   ├── utils
│   ├── widgets
│   └── main.dart
└── ...
```

 - `assets`: assets.
 - `constants`: strings, enums, styles, ref to resources (assets, configs...).
 - `models`: model classes.
 - `services`: api calls.
 - `screens`: each screen with their **local** widgets are packed in one package.
 - `utils`: common utility classes/functions.
 - `widgets`: **global** widgets.
