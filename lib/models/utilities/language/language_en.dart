import 'languages.dart';

class LanguageEn extends Languages {
  static final LanguageEn _singleton = LanguageEn._internal();
  factory LanguageEn() {
    return _singleton;
  }

  LanguageEn._internal();

  @override
  // TODO: implement test
  String get test => 'test';
}
