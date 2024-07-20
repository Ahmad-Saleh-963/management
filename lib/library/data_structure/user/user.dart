import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String name;
  String lastName;
  String email;
  String password;
  String fatherName;
  String matherName;
  String type;
  String? token;
  bool isBand;

  UserModel({
    required this.id,
    required this.name,
    required this.matherName,
    required this.fatherName,
    required this.email,
    required this.type,
    required this.password,
    required this.token,
    required this.isBand,
    required this.lastName,
  });

  RoleUser get roleUser{
    if(type == 'admin'){
      return RoleUser.admin;
    }else if(type == 'user'){
      return RoleUser.user;
    }else if(type == 'adminCenter'){
      return RoleUser.adminCenter;
    }else{
      return RoleUser.logIn;
    }
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

enum RoleUser{
  admin,
  user,
  adminCenter,
  logIn
}