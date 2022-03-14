import 'package:flutter/material.dart';
import 'package:movies_task/ui/ui_constants.dart';
import 'package:movies_task/ui/ui_helper.dart';

class DefaultTextButton extends StatelessWidget {
  final double _buttonElevation = 0.0;
  final double _minWidth = 100.0;
  final double _minHeight = 42.0;
  final String text;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final Color? backGroundColor;
  const DefaultTextButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.textStyle,
      this.backGroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme _colorScheme = UIHelper.getColorScheme(context);
    final TextTheme _textTheme = UIHelper.getTextTheme(context);

    return MaterialButton(
      onPressed: onPressed,
      disabledColor: _colorScheme.onSecondary,
      child: Text(
        text,
        style: textStyle ?? _textTheme.bodyText2,
      ),
      color: (backGroundColor ?? _colorScheme.primary),
      shape: UiConstants.outlinedBorderTextButtonShape,
      height: _minHeight,
      minWidth: _minWidth,
      padding: UiConstants.edgeInsetsDefaultPaddingTextButton,
      elevation: _buttonElevation,
      disabledElevation: _buttonElevation,
    );
  }
}
