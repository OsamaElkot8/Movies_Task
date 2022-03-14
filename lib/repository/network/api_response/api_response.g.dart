// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      status: $enumDecodeNullable(_$ApiStatusEnumMap, json['status']),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      message: (json['message'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': _$ApiStatusEnumMap[instance.status],
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'message': instance.message,
      'errors': instance.errors,
    };

const _$ApiStatusEnumMap = {
  ApiStatus.success: 'success',
  ApiStatus.fail: 'fail',
  ApiStatus.notFound: 'notFound',
  ApiStatus.parametersNotValid: 'parametersNotValid',
  ApiStatus.applicationException: 'applicationException',
  ApiStatus.sessionExists: 'sessionExists',
  ApiStatus.unauthorized: 'unauthorized',
  ApiStatus.oTPRequired: 'oTPRequired',
  ApiStatus.emailVerifyRequired: 'emailVerifyRequired',
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
