class NetworkConstants {
  static const String urlBase = 'http://mistik.trispects.net:8001/api';
  static const String urlLogin = '/login';
  static const String urlAccountDetails = '/account/details';
  static const String urlLogout = '/logout';

  static const String keyId = 'id';
  static const String keyError = 'error';
  static const String keyUserImage = 'user_image';

  static const Map<String, String> requestHeader = {
    'Accept': 'application/json',
    'Content-type': 'application/json'
  };
}
