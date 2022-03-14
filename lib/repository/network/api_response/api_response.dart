import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  ApiStatus? status;
  T? data;
  Map<String, String>? message;
  Map<String, String>? errors;

  ApiResponse({this.status, this.data, this.message, this.errors});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$ApiResponseFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(
    Map<String, dynamic> Function(T value) toJsonT,
  ) {
    return _$ApiResponseToJson<T>(this, toJsonT);
  }
}

enum ApiStatus {
  success,
  fail,
  notFound,
  parametersNotValid,
  applicationException,
  sessionExists,
  unauthorized,
  oTPRequired,
  emailVerifyRequired
}
