// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      id: json['id'] as int,
      urlImage: json['urlImage'] as String?,
      nameImage: json['nameImage'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      fkUser: json['fkUser'] as int,
      nameUser: json['nameUser'] as String,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'id': instance.id,
      'fkUser': instance.fkUser,
      'nameUser': instance.nameUser,
      'nameImage': instance.nameImage,
      'urlImage': instance.urlImage,
      'title': instance.title,
      'description': instance.description,
    };
