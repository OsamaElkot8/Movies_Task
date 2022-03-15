import 'package:flutter/material.dart';
import 'package:movies_task/ui/ui_helper.dart';

class DefaultRoundButton extends StatelessWidget {
  final EdgeInsetsGeometry _defaultContainerPadding =
      const EdgeInsets.all(12.0);
  final Widget child;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  const DefaultRoundButton(
      {Key? key,
      required this.child,
      this.onPressed,
      this.padding,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: ClipOval(
        child: Container(
          color: backgroundColor ?? UIHelper.getColorScheme(context).primary,
          padding: padding ?? _defaultContainerPadding,
          child: child,
        ),
      ),
    );
  }
}
