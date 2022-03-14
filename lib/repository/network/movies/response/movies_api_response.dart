import 'package:json_annotation/json_annotation.dart';
import 'package:movies_task/models/entities/movie/movie.dart';
import 'package:movies_task/repository/network/network_constants.dart';

part 'movies_api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MoviesApiResponse {
  bool? success;
  @JsonKey(name: NetworkConstants.keyStatusMessage)
  String? statusMessage;
  @JsonKey(name: NetworkConstants.keyStatusCode)
  int? statusCode;
  int? page;
  @JsonKey(name: NetworkConstants.keyResult)
  List<Movie>? movies;
  @JsonKey(name: NetworkConstants.keyTotalPages)
  int? totalPages;
  @JsonKey(name: NetworkConstants.keyTotalResults)
  int? totalResults;

  MoviesApiResponse(
      {this.success,
      this.statusMessage,
      this.statusCode,
      this.page,
      this.movies,
      this.totalPages,
      this.totalResults});

  factory MoviesApiResponse.fromJson(Map<String, dynamic> json) =>
      _$MoviesApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesApiResponseToJson(this);
}
