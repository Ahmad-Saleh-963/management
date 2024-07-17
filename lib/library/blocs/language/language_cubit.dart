import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:management_states/library/utils/shared_preferences_helper.dart';
import 'package:management_states/localization/generated/l10n.dart';

import 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState());

  Future<void> init() async {
    emit(state.copyWith(supportedLanguages: _supportedLanguages));
    var currentFromCache = SharedPreferencesHelper.getCurrentAppLanguage();
    var currentLocale = Locale(currentFromCache ?? 'ar');
    emit(state.copyWith(locale: currentLocale));
  }

  Future setCurrentLocale(String code) async {
    await SharedPreferencesHelper.saveCurrentAppLanguage(code);
    emit(state.copyWith(locale: Locale(code)));
  }

  List<SupportedLanguage> get _supportedLanguages {
    return [
      SupportedLanguage(
        langName: S.current.arabicLanguage,
        langCode: 'ar',
        countryCode: 'SY',
      ),
      SupportedLanguage(
        langName: S.current.englishLanguage,
        langCode: 'en',
        countryCode: 'US',
      ),
      SupportedLanguage(
        langName: S.current.turkishLanguage,
        langCode: 'tr',
        countryCode: 'TR',
      ),
    ];
  }
}

class SupportedLanguage {
  final String langName;
  final String langCode;
  final String countryCode;

  SupportedLanguage({
    required this.langName,
    required this.langCode,
    required this.countryCode,
  });
}
