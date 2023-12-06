import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../core/translation_helper/cache_language_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<ChangeLocaleState> {
  LocaleCubit() : super(ChangeLocaleState(locale: const Locale('en')));
  String? appLocal;

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    appLocal = cachedLanguageCode;

    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    appLocal = languageCode;
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
