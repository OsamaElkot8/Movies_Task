import 'package:json_annotation/json_annotation.dart';
import 'package:movies_task/repository/network/network_constants.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  late int id;
  String? email, name, token;
  @JsonKey(name: NetworkConstants.keyUserImage)
  String? avatarUrl;

  User({required this.id, this.email, this.name, this.avatarUrl, this.token});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
