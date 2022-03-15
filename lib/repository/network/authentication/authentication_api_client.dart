import 'package:dio/dio.dart' hide Headers;
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:retrofit/http.dart';

part 'authentication_api_client.g.dart';

@RestApi(baseUrl: NetworkConstants.urlBase)
abstract class AuthenticationApiClient {
  factory AuthenticationApiClient() => _AuthenticationApiClient(Dio()
    ..options.followRedirects = false
    ..options.validateStatus = (status) => status! < 500);

  @GET(NetworkConstants.urlAuthenticationTokenNew)
  Future<ApiResponse> createRequestToken(
      {@Query(NetworkConstants.keyApiKey) required String apiKey});

  @POST(NetworkConstants.urlAuthenticationSessionNew)
  Future<ApiResponse> createSession(
      {@Query(NetworkConstants.keyApiKey) required String apiKey,
      @Body() required Map<String, dynamic> body});

  @POST(NetworkConstants.urlAuthenticationTokenValidateWithLogin)
  Future<ApiResponse> validateLogin(
      {@Query(NetworkConstants.keyApiKey) required String apiKey,
      @Body() required Map<String, dynamic> body});
}
