import 'package:json_annotation/json_annotation.dart';
import 'package:movies_task/repository/network/network_constants.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int? id;
  String? name;
  @JsonKey(name: NetworkConstants.keyStatusMessage)
  String? statusMessage;
  @JsonKey(name: NetworkConstants.keyStatusCode)
  int? statusCode;

  User({this.id, this.name, this.statusMessage, this.statusCode});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
