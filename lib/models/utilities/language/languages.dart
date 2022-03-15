abstract class Languages {
  String get welcomeBack;
  String get username;
  String get password;
  String get login;
  String get movies;
  String get skip;
  String get nowPlayingMovies;
  String get loading;
  String get noMoreMovies;
  String get errorGettingMovies;
  String get actionInProgress;
  String get addedToWatchlist;
  String get failedToAdd;
}

enum EnumLanguage { english, arabic }

extension ExtensionEnumLanguage on EnumLanguage {
  String localeValue() {
    switch (this) {
      case EnumLanguage.arabic:
        return 'ar';
      default:
        return 'en';
    }
  }
}
