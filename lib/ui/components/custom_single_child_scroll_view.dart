import 'package:flutter/material.dart';

class CustomSingleChildScrollView extends StatelessWidget {
  final bool _hasScrollBody = false;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  const CustomSingleChildScrollView(
      {Key? key, required this.child, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: _hasScrollBody,
            child: child,
          ),
        ],
      ),
    );
  }
}
