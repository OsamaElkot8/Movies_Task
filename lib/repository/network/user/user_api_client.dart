import 'package:dio/dio.dart' hide Headers;
import 'package:movies_task/models/entities/user/user.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:retrofit/http.dart';

part 'user_api_client.g.dart';

@RestApi(baseUrl: NetworkConstants.urlBase)
abstract class UserApiClient {
  factory UserApiClient() => _UserApiClient(Dio()
    ..interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler _handler) async {
      SharedPreferences _localStorage = SharedPreferences.instance;

      String token = await _localStorage.getUserLoggedInAccessToken();

      if (token.isNotEmpty) {
        options.headers["Authorization"] = 'Token ' + token;
        _handler.next(options);
      }
    })));

  @GET(NetworkConstants.urlAccountDetails)
  Future<ApiResponse<User>> getLoggedInUserData();

  @POST(NetworkConstants.urlLogout)
  Future<ApiResponse<dynamic>> userLogout();
}
