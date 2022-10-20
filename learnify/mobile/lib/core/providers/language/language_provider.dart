import 'package:flutter/material.dart';

import '../../../product/language/language_options.dart';
import 'app_localizations.dart';

class LanguageProvider extends ChangeNotifier {
  static Locale? _appLocale;
  static LanguageOptions _lang = LanguageOptions.en;

  Locale? get appLocal => _appLocale;
  LanguageOptions get language => _lang;

  Locale? getStoredLang() {
    // TODO: Fix
    // final String? langCode =
    //     LocalManager.instance.getString(LocalManagerKeys.langCode);
    // if (langCode != null) {
    //   _lang = EnumHelpers.langFromString(langCode);
    //   if (_lang == LanguageOptions.en) {
    //     setLanguage(LanguageOptions.en);
    //   } else {
    //     setLanguage(LanguageOptions.tr);
    //   }
    // }
    return _appLocale;
  }

  Future<void> setLanguage(LanguageOptions lang) async {
    _lang = lang;
    _appLocale = AppLocalizations.locales
        .where((Locale e) => e.languageCode == lang.name)
        .first;
    // TODO: Fix
    // await LocalManager.instance
    //     .setString(LocalManagerKeys.langCode, lang.name);
    notifyListeners();
  }

  Future<void> switchLanguage() async {
    if (_lang == LanguageOptions.en) {
      await setLanguage(LanguageOptions.tr);
    } else {
      await setLanguage(LanguageOptions.en);
    }
    notifyListeners();
  }

  Future<void> setLanguageWithLocale(Locale locale) async {
    if (AppLocalizations.locales.contains(locale)) {
      if (locale.languageCode == LanguageOptions.tr.name) {
        await setLanguage(LanguageOptions.tr);
      } else {
        await setLanguage(LanguageOptions.en);
      }
    }
  }
}
