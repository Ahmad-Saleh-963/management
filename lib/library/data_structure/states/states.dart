import 'package:freezed_annotation/freezed_annotation.dart';

part 'states.g.dart';

@JsonSerializable()
class StatesModel {
  int id;
  String name;
  String email;
  String phone;
  String fatherName;
  String matherName;
  String stateType;
  String lang;
  String long;
  @JsonKey(includeToJson: false, includeFromJson: false)
  bool deleting = false;

  StatesModel({
    required this.id,
    required this.name,
    required this.matherName,
    required this.fatherName,
    required this.email,
    required this.phone,
    required this.long,
    required this.lang,
    required this.stateType,
  });

  factory StatesModel.fromJson(Map<String, dynamic> json) =>
      _$StatesModelFromJson(json);

  Map<String, dynamic> toJson() => _$StatesModelToJson(this);
}
