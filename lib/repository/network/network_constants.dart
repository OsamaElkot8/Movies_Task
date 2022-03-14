class NetworkConstants {
  static const String urlBase = 'https://api.themoviedb.org/3';
  static const String urlMoviePosterUrl = 'https://image.tmdb.org/t/p/original';
  static const String urlMovieNowPlaying = '/movie/now_playing';
  static const String urlAuthenticationTokenNew = '/authentication/token/new';
  static const String urlAuthenticationSessionNew =
      '/authentication/session/new';
  static const String urlAuthenticationTokenValidateWithLogin =
      '/authentication/token/validate_with_login';

  static const String keyId = 'id';
  static const String keyPosterPath = 'poster_path';
  static const String keyError = 'error';

  static const Map<String, String> requestHeader = {
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };
}
