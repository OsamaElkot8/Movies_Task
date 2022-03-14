import 'package:flutter/material.dart';
import 'package:movies_task/models/utilities/language/language_ar.dart';
import 'package:movies_task/models/utilities/language/language_en.dart';
import 'package:movies_task/models/utilities/language/languages.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<Languages> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        EnumLanguage.english.localeValue(),
        EnumLanguage.arabic.localeValue()
      ].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) {
    return _locale(locale);
  }

  Future<Languages> _locale(Locale locale) async {
    switch (locale.languageCode.toLowerCase()) {
      case 'ar':
        return LanguageAr();
      default:
        return LanguageEn();
    }
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate old) => false;
}
