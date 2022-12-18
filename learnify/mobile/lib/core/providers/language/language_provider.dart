import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../../../product/language/language_options.dart';
import 'app_localizations.dart';

class LanguageProvider extends ChangeNotifier {
  static Locale? _appLocale;
  static LanguageOptions _lang = LanguageOptions.en;

  LanguageOptions get language => _lang;

  /// Supported [Locale]s in the app.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', 'US'),
    Locale('tr', 'TR'),
    Locale('de', 'DE'),
    Locale('fr', 'FR'),
    Locale('es', 'ES'),
    Locale('ko', 'KR'),
    Locale('ja', 'JP'),
    Locale('ar', 'AE'),
    Locale('mn', 'MN'),
  ];

  /// Current app locale for the current language.
  Locale get appLocal {
    if (_appLocale == null) _getStoredLang();
    return _appLocale!;
  }

  /// List of delegates.
  static const List<LocalizationsDelegate<dynamic>> delegates =
      <LocalizationsDelegate<dynamic>>[
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  void _getStoredLang() {
    // TODO: Fix
    // final Languages? storedLang = SettingsLocalManager.instance
    //     .get(SettingsStorageKeys.language)
    //     ?.toEnum<Languages>(Languages.values);
    // if (storedLang != null) _lang = storedLang;
    // _assignLanguage();
    // _appLocale ??= supportedLocales[0];
    _appLocale ??= supportedLocales[0];
  }

  /// Sets the current language to the given one.
  Future<void> setLanguage(LanguageOptions language) async {
    if (_lang.name == language.name) return;
    _lang = language;
    _assignLanguage();
    // TODO: Fix
    // await SettingsLocalManager.instance
    //     .addOrUpdate(SettingsStorageKeys.language, _lang.name);
    notifyListeners();
  }

  void _assignLanguage() {
    final Locale? newLocale = supportedLocales.firstWhereOrNull(
        (Locale el) => el.languageCode.toLowerCase() == _lang.name);
    if (newLocale != null) _appLocale = newLocale;
  }

  /// Locale list resolution callback.
  Locale localeCallback(List<Locale>? locales) => appLocal;
}
