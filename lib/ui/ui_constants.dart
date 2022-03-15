import 'package:flutter/material.dart';

class UiConstants {
  static const Color colorPrimary = Color(0xff0C3A69);
  static const Color colorSecondary = Colors.grey;
  static const Color colorOnSecondary = Color(0xffeeeeee);
  static const Color colorBackground = Colors.white;
  static const Color colorTransparent = Colors.transparent;

  static const TextStyle textStyleHeadline2 = TextStyle(
      color: colorPrimary,
      fontSize: 30.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.w500);
  static const TextStyle textStyleHeadline3 = TextStyle(
      color: Colors.black,
      fontSize: 22.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.bold);
  static const TextStyle textStyleHeadline4 = TextStyle(
      color: colorPrimary,
      fontSize: 16.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.bold);
  static const TextStyle textStyleBodyText1 = TextStyle(
      color: Colors.black, fontFamily: 'WorkSans', fontWeight: FontWeight.w600);
  static const TextStyle textStyleBodyText2 = TextStyle(
      color: colorPrimary, fontFamily: 'WorkSans', fontWeight: FontWeight.w600);
  static const TextStyle textStyleInputDecorationHintStyle = TextStyle(
      color: colorSecondary,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.w600);
  static const TextStyle textStyleAppBarTitleTextStyle = TextStyle(
      color: colorBackground,
      fontSize: 16.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.bold);
  static const TextStyle textStyleTextButton = TextStyle(
      color: colorBackground,
      fontSize: 16.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.bold);
  static const TextStyle textStyleOutlinedButton = TextStyle(
      color: colorPrimary,
      fontSize: 16.0,
      fontFamily: 'WorkSans',
      fontWeight: FontWeight.bold);

  static const Radius _radiusTextButtonCorners = Radius.circular(50.0);

  static const OutlinedBorder outlinedBorderTextButtonShape =
      RoundedRectangleBorder(
          borderRadius: BorderRadius.all(_radiusTextButtonCorners));

  static const EdgeInsets edgeInsetsDefaultPaddingButton =
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0);

  static const String stringEmpty = '';
  static const String stringSpace = ' ';
  static const String stringExclamationMark = '!';
  static const String stringColonSymbol = ':';
  static const String stringNewLine = '\n';
  static const String stringLeftCurleyBrace = '{';
  static const String stringRightCurleyBrace = '}';
  static const String stringSlashSymbol = '/';

  static const String stringDefaultImagePlaceholderPath =
      'assets/images/image_placeholder.png';
}
