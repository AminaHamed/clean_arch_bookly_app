import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';

Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates = [
  AppLocalizations.delegate,
  GlobalMaterialLocalizations.delegate,
  GlobalWidgetsLocalizations.delegate,
  GlobalCupertinoLocalizations.delegate
];

Locale localeResolutionCallback(
    Locale? deviceLocale, Iterable<Locale> supportedLocales) {
  for (var locale in supportedLocales) {
    if (deviceLocale != null &&
        deviceLocale.languageCode == locale.languageCode) {
      return deviceLocale;
    }
  }
  return supportedLocales.first;
}
