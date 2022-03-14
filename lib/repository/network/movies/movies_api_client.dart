import 'package:dio/dio.dart' hide Headers;
import 'package:movies_task/models/entities/movie/movie.dart';
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:retrofit/http.dart';

part 'movies_api_client.g.dart';

@RestApi(baseUrl: NetworkConstants.urlBase)
abstract class MoviesApiClient {
  factory MoviesApiClient() => _MoviesApiClient(Dio());

  @GET(NetworkConstants.urlMovieNowPlaying)
  Future<ApiResponse<List<Movie>>> getNowPlayingMovies();
}
