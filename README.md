# SmartSchool Pro

SmartSchool Pro is a production-ready multi-tenant school management system with LMS, built with Flutter, Dart, Firebase, and Riverpod.

## Tech stack

- Flutter + Dart
- Firebase Authentication
- Cloud Firestore
- Firebase Storage
- Cloud Functions
- Firebase Hosting
- Firebase Analytics / Crashlytics / App Check
- Riverpod
- GoRouter
- fl_chart

## Branding

Always preserve the following branding in the app and documentation:

- “SmartSchool Pro — Developed by Cybaware Solutions Private Limited”
- “Code Developed by Vaibhav Kumar Mishra”
- “© 2026 Cybaware Solutions Private Limited”

## Getting started

1. Install Flutter SDK 3.3+
2. Run `flutter pub get`
3. Set up Firebase for the project
4. Replace placeholders in `lib/firebase_options.dart` with your project values
5. Run `flutter run`

## Project structure

```text
lib/
  app.dart
  firebase_options.dart
  main.dart
  core/
    routes/
    theme/
  features/
    auth/
    super_admin/
    school_admin/
```

## Notes

This repository currently includes the foundational app shell, Firebase initialization, authentication flow, role-based routing, and the first dashboards for Super Admin and School Admin.
