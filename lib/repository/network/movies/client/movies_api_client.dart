import 'package:dio/dio.dart' hide Headers;
import 'package:movies_task/repository/network/movies/response/movies_api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:retrofit/http.dart';

part 'movies_api_client.g.dart';

@RestApi(baseUrl: NetworkConstants.urlBase)
abstract class MoviesApiClient {
  factory MoviesApiClient() => _MoviesApiClient(Dio()
    ..options.followRedirects = false
    ..options.validateStatus = (status) => status! < 500);

  @GET(NetworkConstants.urlMovieNowPlaying)
  Future<MoviesApiResponse> getNowPlayingMovies(
      {@Query(NetworkConstants.keyApiKey) required String apiKey,
      @Query(NetworkConstants.keyPage) required int page});
}
