import 'package:dio/dio.dart' hide Headers;
import 'package:movies_task/models/entities/user/user.dart';
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:retrofit/http.dart';

part 'authentication_api_client.g.dart';

@RestApi(baseUrl: NetworkConstants.urlBase)
abstract class AuthenticationApiClient {
  factory AuthenticationApiClient() => _AuthenticationApiClient(Dio());

  @GET(NetworkConstants.urlAuthenticationTokenNew)
  Future<ApiResponse<String>> createRequestToken();

  @POST(NetworkConstants.urlAuthenticationSessionNew)
  @Headers(NetworkConstants.requestHeader)
  Future<ApiResponse<String>> createSession(@Body() Map<String, dynamic> body);

  @POST(NetworkConstants.urlAuthenticationTokenValidateWithLogin)
  @Headers(NetworkConstants.requestHeader)
  Future<ApiResponse<User>> validateLogin(@Body() Map<String, dynamic> body);
}
