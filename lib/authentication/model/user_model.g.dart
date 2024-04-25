// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      id: json['id'] as int?,
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
      birthday: json['birthday'] as String? ?? '',
      user_type: json['user_type'] as String? ?? '',
      village_id: json['village_id'] as String? ?? '',
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      mobile: json['mobile'] as String? ?? '',
      tel: json['tel'] as String? ?? '',
      gender: json['gender'] as String? ?? '',
      profileFlag: json['profileFlag'] as String? ?? '',
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'birthday': instance.birthday,
      'user_type': instance.user_type,
      'village_id': instance.village_id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'mobile': instance.mobile,
      'tel': instance.tel,
      'gender': instance.gender,
      'profileFlag': instance.profileFlag,
    };
