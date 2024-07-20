// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_exam_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitExamModel _$InitExamModelFromJson(Map<String, dynamic> json) =>
    InitExamModel(
      id: json['id'] as int,
      numbers: json['numbers'] as String,
      timeEnd: json['timeEnd'] as int,
      level: json['level'] as int,
      isStart: json['isStart'] as bool,
    );

Map<String, dynamic> _$InitExamModelToJson(InitExamModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timeEnd': instance.timeEnd,
      'level': instance.level,
      'numbers': instance.numbers,
      'isStart': instance.isStart,
    };
