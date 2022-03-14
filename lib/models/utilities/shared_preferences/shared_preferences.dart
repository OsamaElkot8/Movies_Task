import 'package:flutter/material.dart';
import 'package:movies_task/models/utilities/enum_to_string.dart';
import 'package:movies_task/models/utilities/language/languages.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences_constants.dart';
import 'package:movies_task/ui/ui_constants.dart';
import 'package:shared_preferences/shared_preferences.dart'
    as external_shared_preferences;

class SharedPreferences {
  static final SharedPreferences instance = SharedPreferences._internal();
  external_shared_preferences.SharedPreferences? _prefs;

  factory SharedPreferences() {
    return instance;
  }

  SharedPreferences._internal() {
    _initializeSharedPreferences();
  }

  Future<void> _initializeSharedPreferences() async {
    _prefs = await external_shared_preferences.SharedPreferences.getInstance();
  }

  Future<external_shared_preferences.SharedPreferences?> _getPrefs() async {
    if (_prefs == null) await _initializeSharedPreferences();
    return _prefs;
  }

  Future<bool> setUserLoggedInToken(String accessToken) async {
    return await (await _getPrefs())!
        .setString(SharedPreferencesConstants.keyAccessToken, accessToken);
  }

  Future<String> getUserLoggedInAccessToken() async {
    return (await _getPrefs())!
            .getString(SharedPreferencesConstants.keyAccessToken) ??
        UiConstants.stringEmpty;
  }

  Future<bool> setLocale(Locale locale) async {
    return await (await _getPrefs())!
        .setString(SharedPreferencesConstants.keyLocale, locale.languageCode);
  }

  Future<Locale> getLocale() async {
    String _localeLanguageCode =
        (await _getPrefs())!.getString(SharedPreferencesConstants.keyLocale) ??
            EnumLanguage.english.localeValue();
    return Locale(_localeLanguageCode);
  }

  Future<bool> setTheme(ThemeMode themeMode) async {
    return await (await _getPrefs())!.setString(
        SharedPreferencesConstants.keyTheme,
        EnumToString().convertToString(themeMode));
  }

  Future<ThemeMode> getTheme() async {
    String? _themeInString =
        (await _getPrefs())!.getString(SharedPreferencesConstants.keyTheme);
    if (_themeInString == null) return ThemeMode.light;
    return EnumToString()
        .fromString<ThemeMode>(ThemeMode.values, _themeInString);
  }
}
