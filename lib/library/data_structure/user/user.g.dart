// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      matherName: json['matherName'] as String,
      fatherName: json['fatherName'] as String,
      email: json['email'] as String,
      type: json['type'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'phone': instance.phone,
      'fatherName': instance.fatherName,
      'matherName': instance.matherName,
      'type': instance.type,
      'token': instance.token,
    };
