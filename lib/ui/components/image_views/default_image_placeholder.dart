import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_task/ui/ui_constants.dart';

class DefaultImagePlaceHolder extends StatelessWidget {
  final double? height, width;
  const DefaultImagePlaceHolder({Key? key, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      UiConstants.stringDefaultImagePlaceholderPath,
      fit: BoxFit.cover,
      height: height,
      width: width,
    );
  }
}
