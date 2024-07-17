import 'package:freezed_annotation/freezed_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class NewsModel {
  int id;
  int fkUser;
  String nameUser;
  String? nameImage;
  String? urlImage;
  String title;
  String description;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool deleting = false;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool editing = false;

  NewsModel({
    required this.id,
    required this.urlImage,
    required this.nameImage,
    required this.title,
    required this.description,
    required this.fkUser,
    required this.nameUser,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
