import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:management_states/library/data_structure/states/states.dart';
part 'list_states_state.freezed.dart';

@freezed
class ListStatesState with _$ListStatesState {
  factory ListStatesState.initial({
    @Default(false) bool deleting,
    @Default(false) bool loading,
    @Default('') String date,
  }) = _initial;
}