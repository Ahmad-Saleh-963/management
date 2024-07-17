// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'states.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatesModel _$StatesModelFromJson(Map<String, dynamic> json) => StatesModel(
      id: json['id'] as int,
      name: json['name'] as String,
      matherName: json['matherName'] as String,
      fatherName: json['fatherName'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      long: json['long'] as String,
      lang: json['lang'] as String,
      stateType: json['stateType'] as String,
    );

Map<String, dynamic> _$StatesModelToJson(StatesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'fatherName': instance.fatherName,
      'matherName': instance.matherName,
      'stateType': instance.stateType,
      'lang': instance.lang,
      'long': instance.long,
    };
