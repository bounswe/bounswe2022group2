import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  AppLocalizations(this._locale);
  final Locale _locale;

  static AppLocalizations? of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static AppLocalizations? get instance => _AppLocalizationsDelegate.instance;

  static List<LocalizationsDelegate<dynamic>> get localDelegates =>
      <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ];

  static List<Locale> get locales => <Locale>[
        const Locale('en', 'US'),
        const Locale('tr', 'TR'),
      ];

  static Locale localeCallback(List<Locale>? locales,
      Iterable<Locale> supportedLocales, BuildContext context) {
    for (final Locale locale in locales!) {
      if (supportedLocales.contains(locale)) {
        // TODO: Fix
        // context.read<LanguageProvider>().setLanguageWithLocale(locale);
        return locale;
      }
    }
    return const Locale('en', 'US');
  }

  final Map<String, String> _localizedValues = <String, String>{};

  // TODO: Fix
  Future<void> load() async {}

  String translate(String key) => _localizedValues[key] ?? 'Not Found';
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  static AppLocalizations? instance;

  @override
  bool isSupported(Locale locale) => AppLocalizations.locales
      .where((Locale el) => el.languageCode == locale.languageCode)
      .isNotEmpty;

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localization = AppLocalizations(locale);
    await localization.load();
    instance = localization;
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
