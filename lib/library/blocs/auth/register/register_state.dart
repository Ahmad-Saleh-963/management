import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState.initial({
    @Default(false) bool loading,
    @Default(false) bool login,
  }) = _initial;
}
