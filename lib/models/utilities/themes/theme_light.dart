import 'package:flutter/material.dart';
import 'package:movies_task/ui/ui_constants.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: UiConstants.colorPrimary,
  scaffoldBackgroundColor: UiConstants.colorBackground,
  colorScheme: const ColorScheme.light(
      primary: UiConstants.colorPrimary,
      secondary: UiConstants.colorSecondary,
      onSecondary: UiConstants.colorOnSecondary,
      background: UiConstants.colorBackground),
  textTheme: const TextTheme(
      bodyText2: UiConstants.textStyleBodyText2,
      headline2: UiConstants.textStyleHeadline2,
      headline3: UiConstants.textStyleHeadline3,
      headline4: UiConstants.textStyleHeadline4),
  appBarTheme: const AppBarTheme(
    backgroundColor: UiConstants.colorPrimary,
    titleTextStyle: UiConstants.textStyleAppBarTitleTextStyle,
    iconTheme: IconThemeData(color: UiConstants.colorBackground),
  ),
);
