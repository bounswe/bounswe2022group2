import 'dart:collection';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'language_provider.dart';

/// Localizations class for multi-language support.
class AppLocalizations {
  /// Default constructor of the [AppLocalizations] with a [Locale] parameter.
  AppLocalizations(this._locale);

  final Locale _locale;

  /// Returns the corresponding [AppLocalizations].
  static AppLocalizations? of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  /// Returns the corresponding [LocalizationsDelegate].
  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  LinkedHashMap<String, dynamic> _localizedValues =
      LinkedHashMap<String, dynamic>(
          equals: (String a, String b) => a.toLowerCase() == b.toLowerCase(),
          hashCode: (String key) => key.toLowerCase().hashCode);

  /// Loads the corresponding language json from the assets folder.
  Future<void> load() async {
    final String jsonStringValues =
        await rootBundle.loadString('assets/lang/${_locale.languageCode}.json');
    final Map<String, String> mappedJson =
        Map.castFrom(await json.decode(jsonStringValues));
    _localizedValues = LinkedHashMap<String, dynamic>.from(mappedJson.map(
        (String key, String value) =>
            MapEntry<String, String>(key, value.toString())));
  }

  /// Returns the translated text for the given key by looking at the map.
  String translate(String key) => _localizedValues[key] ?? 'NOT FOUND';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      LanguageProvider.supportedLocales.firstWhereOrNull(
          (Locale el) => el.languageCode == locale.languageCode) !=
      null;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localization = AppLocalizations(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
