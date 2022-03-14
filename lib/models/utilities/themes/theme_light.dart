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
    inputDecorationTheme: const InputDecorationTheme(
      border: UiConstants.inoutBorderInputDecoration,
      focusedBorder: UiConstants.inoutBorderInputDecoration,
      hintStyle: UiConstants.textStyleInputDecorationHintStyle,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: UiConstants.colorPrimary,
        titleTextStyle: UiConstants.textStyleAppBarTitleTextStyle,
        iconTheme: IconThemeData(color: UiConstants.colorBackground)),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          elevation: UiConstants.elevationTextButton,
          backgroundColor: UiConstants.colorPrimary,
          shape: UiConstants.outlinedBorderTextButtonShape,
          textStyle: UiConstants.textStyleTextButton,
          primary: UiConstants.colorBackground,
          minimumSize: UiConstants.sizeMinimumTextButton,
          padding: UiConstants.edgeInsetsDefaultPaddingTextButton),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          backgroundColor: UiConstants.colorBackground,
          shape: UiConstants.outlinedBorderOutlinedButtonShape,
          textStyle: UiConstants.textStyleOutlinedButton,
          primary: UiConstants.colorPrimary,
          minimumSize: UiConstants.sizeMinimumOutlinedButton,
          padding: UiConstants.edgeInsetsDefaultPaddingOutlinedButton,
          side: UiConstants.borderSideOutlinedButtonSide),
    ));
