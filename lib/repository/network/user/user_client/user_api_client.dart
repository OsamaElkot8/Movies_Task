import 'package:dio/dio.dart' hide Headers;
import 'package:movies_task/models/entities/user/user.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:retrofit/http.dart';

part 'user_api_client.g.dart';

@RestApi(baseUrl: NetworkConstants.urlBase)
abstract class UserApiClient {
  factory UserApiClient() => _UserApiClient(Dio()
    ..options.followRedirects = false
    ..options.validateStatus = (status) => status! < 500);

  @GET(NetworkConstants.urlAccount)
  Future<User> getAccountDetails(
      {@Query(NetworkConstants.keySessionId) required String sessionId,
      @Query(NetworkConstants.keyApiKey) required String apiKey});
}
