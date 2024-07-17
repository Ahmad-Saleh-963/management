import 'package:freezed_annotation/freezed_annotation.dart';
part 'add_news_state.freezed.dart';

@freezed
class AddNewsState with _$AddNewsState {
  factory AddNewsState.initial({
    @Default(false) bool deleting,
    @Default(false) bool loading,
    @Default('') String date,
  }) = _initial;
}

