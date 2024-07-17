import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'language_cubit.dart';

part 'language_state.freezed.dart';

@freezed
class LanguageState with _$LanguageState {
  factory LanguageState({
    Locale? locale,
    List<SupportedLanguage>? supportedLanguages,
  }) = _LanguageState;
}
