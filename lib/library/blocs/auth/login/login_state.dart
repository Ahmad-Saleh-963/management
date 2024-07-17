import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState.initial({
    @Default(false) bool loading,
    @Default(false) bool login,
  }) = _initial;
}
