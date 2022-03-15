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
  final bool? isLoading;
  const DefaultTextButton(
      {Key? key,
      required this.text,
      this.onPressed,
      this.textStyle,
      this.backGroundColor,
      this.isLoading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorScheme _colorScheme = UIHelper.getColorScheme(context);

    return MaterialButton(
      onPressed: onPressed,
      disabledColor: _colorScheme.onSecondary,
      child: _childView(context),
      color: (backGroundColor ?? _colorScheme.primary),
      shape: UiConstants.outlinedBorderTextButtonShape,
      height: _minHeight,
      minWidth: _minWidth,
      padding: UiConstants.edgeInsetsDefaultPaddingButton,
      elevation: _buttonElevation,
      disabledElevation: _buttonElevation,
    );
  }

  Widget _childView(BuildContext context) {
    final ColorScheme _colorScheme = UIHelper.getColorScheme(context);
    final TextTheme _textTheme = UIHelper.getTextTheme(context);

    if (isLoading!) {
      return CircularProgressIndicator(
        color: _colorScheme.background,
      );
    }

    return Text(
      text,
      style: textStyle ??
          _textTheme.bodyText2!.copyWith(color: _colorScheme.background),
    );
  }
}
