import 'package:json_annotation/json_annotation.dart';
import 'package:movies_task/repository/network/network_constants.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  bool? success;
  @JsonKey(name: NetworkConstants.keyRequestToken)
  String? requestToken;
  @JsonKey(name: NetworkConstants.keyStatusMessage)
  String? statusMessage;
  @JsonKey(name: NetworkConstants.keyStatusCode)
  int? statusCode;
  @JsonKey(name: NetworkConstants.keySessionId)
  String? sessionId;

  ApiResponse(
      {this.success,
      this.requestToken,
      this.statusMessage,
      this.statusCode,
      this.sessionId});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);
}
