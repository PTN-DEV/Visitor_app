// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_modelList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      responeseStatus: json['responese_status'] as String? ?? '',
      messsage: json['message'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'responese_status': instance.responeseStatus,
      'message': instance.messsage,
      'data': instance.data,
    };
