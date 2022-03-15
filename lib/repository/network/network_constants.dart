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
  static const String urlWatchList = '/watchlist';

  static const String keyId = 'id';
  static const String keyPosterPath = 'poster_path';
  static const String keyError = 'error';
  static const String keyUsername = 'username';
  static const String keyPassword = 'password';
  static const String keyRequestToken = 'request_token';
  static const String keySessionId = 'session_id';
  static const String keyApiKey = 'api_key';
  static const String keyPage = 'page';
  static const String keyStatusMessage = 'status_message';
  static const String keyStatusCode = 'status_code';
  static const String keyResult = 'results';
  static const String keyTotalPages = 'total_pages';
  static const String keyTotalResults = 'total_results';
  static const String keyMediaType = 'media_type';
  static const String keyMediaId = 'media_id';
  static const String keyWatchlist = 'watchlist';

  static const String apiKey = '31521ab741626851b73c684539c33b5a';

  static const int success = 1;

  static const Map<String, String> requestHeader = {
    'Content-type': 'application/json;charset=utf-8'
  };
}
