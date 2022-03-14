// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
      success: json['success'] as bool?,
      requestToken: json['request_token'] as String?,
      statusMessage: json['status_message'] as String?,
      statusCode: json['status_code'] as int?,
      sessionId: json['session_id'] as String?,
    );

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'request_token': instance.requestToken,
      'status_message': instance.statusMessage,
      'status_code': instance.statusCode,
      'session_id': instance.sessionId,
    };
