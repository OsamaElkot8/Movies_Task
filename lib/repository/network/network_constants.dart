class NetworkConstants {
  static const String urlBase = 'https://api.themoviedb.org/3';
  static const String urlMoviePosterUrl = 'https://image.tmdb.org/t/p/original';
  static const String urlMovieNowPlaying = '/movie/now_playing';
  static const String urlAuthenticationTokenNew = '/authentication/token/new';
  static const String urlAuthenticationSessionNew =
      '/authentication/session/new';
  static const String urlAuthenticationTokenValidateWithLogin =
      '/authentication/token/validate_with_login';
  static const String urlAccount = '/account';

  static const String keyId = 'id';
  static const String keyPosterPath = 'poster_path';
  static const String keyError = 'error';
  static const String keyUsername = 'username';
  static const String keyPassword = 'password';
  static const String keyRequestToken = 'request_token';
  static const String keySessionId = 'session_id';
  static const String keyApiKey = 'api_key';
  static const String keyPage = 'page';

  static const String apiKey = '31521ab741626851b73c684539c33b5a';

  static const Map<String, String> requestHeader = {
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };
}
