import 'languages.dart';

class LanguageAr extends Languages {
  static final LanguageAr _singleton = LanguageAr._internal();
  factory LanguageAr() {
    return _singleton;
  }

  LanguageAr._internal();

  @override
  // TODO: implement welcomeBack
  String get welcomeBack => 'Welcome Back';

  @override
  // TODO: implement username
  String get username => 'Username';

  @override
  // TODO: implement login
  String get login => 'Login';

  @override
  // TODO: implement password
  String get password => 'Password';

  @override
  // TODO: implement movies
  String get movies => 'Movies';

  @override
  // TODO: implement skip
  String get skip => 'Skip';

  @override
  // TODO: implement nowPlayingMovies
  String get nowPlayingMovies => 'Now Playing Movies';

  @override
  // TODO: implement errorGettingMovies
  String get errorGettingMovies => 'Error getting movies';

  @override
  // TODO: implement loading
  String get loading => 'Loading';

  @override
  // TODO: implement noMoreMovies
  String get noMoreMovies => 'No more movies';
}
