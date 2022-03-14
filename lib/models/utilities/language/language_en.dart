import 'languages.dart';

class LanguageEn extends Languages {
  static final LanguageEn _singleton = LanguageEn._internal();
  factory LanguageEn() {
    return _singleton;
  }

  LanguageEn._internal();

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
