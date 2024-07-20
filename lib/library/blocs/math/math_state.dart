import 'package:freezed_annotation/freezed_annotation.dart';


part 'math_state.freezed.dart';

@freezed
class MathState with _$MathState {
  factory MathState.initial({
    @Default(false) bool deleting,
    @Default(false) bool loading,
    @Default('') String date,
  }) = _initial;
}