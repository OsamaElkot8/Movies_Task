import 'languages.dart';

class LanguageAr extends Languages {
  static final LanguageAr _singleton = LanguageAr._internal();
  factory LanguageAr() {
    return _singleton;
  }

  LanguageAr._internal();

  @override
  // TODO: implement test
  String get test => 'test';
}
