import 'package:flutter/material.dart';
import 'package:movies_task/ui/ui_constants.dart';
import 'package:movies_task/ui/ui_helper.dart';

class DefaultColorlessButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const DefaultColorlessButton(
      {Key? key, required this.onPressed, required this.child})
      : super(key: key);

  final Size _buttonMinimumSize = const Size(100.0, 42.0);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = UIHelper.getTextTheme(context);
    ColorScheme _colorScheme = UIHelper.getColorScheme(context);

    return TextButton(
        onPressed: onPressed,
        child: child,
        style: TextButton.styleFrom(
            backgroundColor: UiConstants.colorTransparent,
            textStyle: _textTheme.bodyText2,
            primary: _colorScheme.primary,
            minimumSize: _buttonMinimumSize,
            padding: UiConstants.edgeInsetsDefaultPaddingButton));
  }
}
