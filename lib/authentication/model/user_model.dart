// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

//flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable()
class UserData {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'email', defaultValue: '')
  String? email;

  @JsonKey(name: 'password', defaultValue: '')
  String? password;

  @JsonKey(name: 'birthday', defaultValue: '')
  String? birthday;

  @JsonKey(name: 'user_type', defaultValue: '')
  String? user_type;

  @JsonKey(name: 'village_id', defaultValue: '')
  String? village_id;

  @JsonKey(name: 'firstname', defaultValue: '')
  String? firstname;

  @JsonKey(name: 'lastname', defaultValue: '')
  String? lastname;

  @JsonKey(name: 'mobile', defaultValue: '')
  String? mobile;

  @JsonKey(name: 'tel', defaultValue: '')
  String? tel;

  @JsonKey(name: 'gender', defaultValue: '')
  String? gender;

  @JsonKey(name: 'profileFlag', defaultValue: '')
  String? profileFlag;
  UserData(
      {this.id,
      this.email,
      this.password,
      this.birthday,
      this.user_type,
      this.village_id,
      this.firstname,
      this.lastname,
      this.mobile,
      this.tel,
      this.gender,
      this.profileFlag});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
