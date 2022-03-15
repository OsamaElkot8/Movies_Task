import 'package:flutter/material.dart';

class UIHelper {
  static ThemeData getTheme(BuildContext context) => Theme.of(context);
  static ColorScheme getColorScheme(BuildContext context) =>
      getTheme(context).colorScheme;
  static TextTheme getTextTheme(BuildContext context) =>
      getTheme(context).textTheme;
  static InputDecorationTheme getInputDecorationTheme(BuildContext context) =>
      getTheme(context).inputDecorationTheme;

  static showSnackBarMessage(BuildContext context, {required String message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  static showLoading(BuildContext context) {
    final ColorScheme _colorScheme = getColorScheme(context);
    const double _indicatorHeight = 60.0;
    const double _indicatorWidth = 60.0;
    final BorderRadius _indicatorBorderRadius = BorderRadius.circular(4.0);
    const EdgeInsets _indicatorPadding = EdgeInsets.all(12.0);

    return showDialog(
      context: context,
      builder: (context) => Center(
        child: Container(
          width: _indicatorHeight,
          height: _indicatorWidth,
          decoration: BoxDecoration(
            color: _colorScheme.background,
            borderRadius: _indicatorBorderRadius,
          ),
          child: const Padding(
            padding: _indicatorPadding,
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  static hideLoading(BuildContext context) => Navigator.pop(context);
}
