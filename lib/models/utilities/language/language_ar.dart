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
  // TODO: implement email
  String get email => 'Email';

  @override
  // TODO: implement login
  String get login => 'Login';

  @override
  // TODO: implement password
  String get password => 'Password';
}
