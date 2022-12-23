/// Language options.
enum LanguageOptions {
  /// English language.
  en,

  /// Turkish language.
  tr,

  de,
  fr,
  es,
  ko,
  ja,
  ar,
  mn
}

extension LanguageHelpers on LanguageOptions {
  String get languageName {
    switch (this) {
      case LanguageOptions.en:
        return 'English';
      case LanguageOptions.tr:
        return 'Türkçe';
      case LanguageOptions.ko:
        return '한국인';
      case LanguageOptions.ja:
        return '日本';
      case LanguageOptions.fr:
        return 'Français';
      case LanguageOptions.es:
        return 'Español';
      case LanguageOptions.de:
        return 'Deutsch';
      case LanguageOptions.ar:
        return 'ارابكا';
      case LanguageOptions.mn:
        return 'Монгол';
    }
  }
}
