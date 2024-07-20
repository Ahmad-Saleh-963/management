import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'init_exam_model.g.dart';

@JsonSerializable()
class InitExamModel {
  int id;
  int timeEnd;
  int level;
  String numbers;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool deleting = false;
  bool isStart = false;

  InitExamModel({
    required this.id,
    required this.numbers,
    required this.timeEnd,
    required this.level,
    required this.isStart,
  });

 List<List> get getExam{
    if(numbers.isEmpty)return [];
    List<List> exam = [];
    final data = jsonDecode(numbers);
    for(var i in data){
      exam.add(i);
    }
    return exam;
  }

  factory InitExamModel.fromJson(Map<String, dynamic> json) =>
      _$InitExamModelFromJson(json);

  Map<String, dynamic> toJson() => _$InitExamModelToJson(this);
}
