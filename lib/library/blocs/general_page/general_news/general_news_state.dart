import 'package:freezed_annotation/freezed_annotation.dart';
part 'general_news_state.freezed.dart';

@freezed
class GeneralNewsState with _$GeneralNewsState {
  factory GeneralNewsState.initial({
    @Default(false) bool deleting,
    @Default(false) bool loading,
    @Default('') String date,
  }) = _initial;
}

