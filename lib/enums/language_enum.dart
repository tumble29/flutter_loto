import '/gen/gen.dart';

extension AppLocaleEnum on AppLocale {
  String get description {
    switch (this) {
      case AppLocale.en:
        return 'English';
      case AppLocale.vi:
        return 'Tiếng Việt';
    }
  }
}
