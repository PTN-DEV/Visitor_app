import 'package:json_annotation/json_annotation.dart';
import 'package:visitor/authentication/model/user_model.dart';
part 'user_modelList.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: 'responese_status', defaultValue: '')
  String? responeseStatus;

  @JsonKey(name: 'message', defaultValue: '')
  String? messsage;

  @JsonKey(name: 'data', defaultValue: [])
  List<UserData>? data;

  User({
    this.responeseStatus,
    this.messsage,
    this.data,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
