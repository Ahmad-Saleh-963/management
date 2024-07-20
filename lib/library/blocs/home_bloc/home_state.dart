import 'package:freezed_annotation/freezed_annotation.dart';


part 'home_state.freezed.dart';

@freezed
class MapState with _$MapState {
  factory MapState.initial({
    @Default(false) bool deleting,
    @Default(false) bool loading,
    @Default('') String date,
  }) = _initial;
}