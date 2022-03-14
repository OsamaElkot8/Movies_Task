// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps

class _UserApiClient implements UserApiClient {
  _UserApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.themoviedb.org/3';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<User> getAccountDetails({required sessionId, required apiKey}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'session_id': sessionId,
      r'api_key': apiKey
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/account',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
