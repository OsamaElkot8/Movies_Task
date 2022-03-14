import 'package:flutter/material.dart';

class UIHelper {
  static ThemeData getTheme(BuildContext context) => Theme.of(context);
  static ColorScheme getColorScheme(BuildContext context) =>
      getTheme(context).colorScheme;
  static TextTheme getTextTheme(BuildContext context) =>
      getTheme(context).textTheme;
  static InputDecorationTheme getInputDecorationTheme(BuildContext context) =>
      getTheme(context).inputDecorationTheme;
}
