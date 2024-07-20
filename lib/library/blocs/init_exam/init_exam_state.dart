import 'package:freezed_annotation/freezed_annotation.dart';


part 'init_exam_state.freezed.dart';

@freezed
class InitExamState with _$InitExamState {
  factory InitExamState.initial({
    @Default(false) bool deleting,
    @Default(false) bool loading,
    @Default(false) bool hasError,
    @Default(true) bool hasExam,
    @Default('') String date,
  }) = _initial;
}