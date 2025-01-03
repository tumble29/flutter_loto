enum LanguageEnum { en, vi }

extension LanguageEnumExt on LanguageEnum {
  String get description {
    switch (this) {
      case LanguageEnum.en:
        return 'English';
      case LanguageEnum.vi:
        return 'Tiếng Việt';
    }
  }
}
