// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesApiResponse _$MoviesApiResponseFromJson(Map<String, dynamic> json) =>
    MoviesApiResponse(
      success: json['success'] as bool?,
      statusMessage: json['status_message'] as String?,
      statusCode: json['status_code'] as int?,
      page: json['page'] as int?,
      movies: (json['results'] as List<dynamic>?)
          ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$MoviesApiResponseToJson(MoviesApiResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status_message': instance.statusMessage,
      'status_code': instance.statusCode,
      'page': instance.page,
      'results': instance.movies,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
