import 'package:dio/dio.dart' hide Headers;
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/movies/response/movies_api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:movies_task/ui/ui_constants.dart';
import 'package:retrofit/http.dart';

part 'watch_list_movies_api_client.g.dart';

@RestApi(baseUrl: NetworkConstants.urlBase)
abstract class WatchListMoviesApiClient {
  factory WatchListMoviesApiClient() => _WatchListMoviesApiClient(Dio()
    ..options.followRedirects = false
    ..options.validateStatus = (status) => status! < 500);

  @POST(NetworkConstants.urlAccount +
      UiConstants.stringSlashSymbol +
      UiConstants.stringLeftCurleyBrace +
      NetworkConstants.keyId +
      UiConstants.stringRightCurleyBrace +
      UiConstants.stringSlashSymbol +
      NetworkConstants.urlWatchList)
  @Headers(NetworkConstants.requestHeader)
  Future<ApiResponse> addToWatchList(
      {@Path(NetworkConstants.keyId) required int accountId,
      @Query(NetworkConstants.keyApiKey) required String apiKey,
      @Query(NetworkConstants.keySessionId) required String sessionId,
      @Body() required Map<String, dynamic> body});

  @GET(NetworkConstants.urlAccount +
      UiConstants.stringSlashSymbol +
      UiConstants.stringLeftCurleyBrace +
      NetworkConstants.keyId +
      UiConstants.stringRightCurleyBrace +
      UiConstants.stringSlashSymbol +
      NetworkConstants.urlWatchList +
      UiConstants.stringSlashSymbol +
      NetworkConstants.urlMovies)
  Future<MoviesApiResponse> getMovieWatchlist({
    @Path(NetworkConstants.keyId) required int accountId,
    @Query(NetworkConstants.keyApiKey) required String apiKey,
    @Query(NetworkConstants.keySessionId) required String sessionId,
  });
}
