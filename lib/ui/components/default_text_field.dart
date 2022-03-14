import 'package:flutter/material.dart';
import 'package:movies_task/ui/ui_helper.dart';

class DefaultTextField extends StatefulWidget {
  final String? label, helperText, initialValue;
  final TextEditingController? controller;
  final bool obscuringEnabled;
  final bool? enabled;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const DefaultTextField(
      {Key? key,
      this.label,
      this.controller,
      this.obscuringEnabled = false,
      this.helperText,
      this.validator,
      this.onChanged,
      this.enabled = true,
      this.initialValue})
      : super(key: key);

  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _obscureText = false;

  ColorScheme get _colorScheme => UIHelper.getColorScheme(context);
  TextTheme get _textTheme => UIHelper.getTextTheme(context);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
    // in case of obscuring enabled, initialize text obscure to be secured.
    if (widget.obscuringEnabled) _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      style: _textTheme.headline2,
      decoration: InputDecoration(
          label: _labelView(context),
          suffixIcon: _suffixView(context),
          helperText: _helperText(),
          helperStyle:
              _textTheme.bodyText1!.copyWith(color: _colorScheme.onSecondary)),
      obscureText: _obscureText,
      validator: widget.validator,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      initialValue: widget.initialValue,
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  Widget? _labelView(BuildContext context) {
    if (widget.label == null) return null;

    return Text(
      widget.label!,
      style: _textTheme.headline2!.copyWith(
          color: _focusNode.hasFocus
              ? _colorScheme.primary
              : _colorScheme.onSecondary),
    );
  }

  Widget? _suffixView(BuildContext context) {
    if (!widget.obscuringEnabled) return null;

    return IconButton(
      icon: Icon(
        _obscureText ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: () => setState(() => _obscureText = !_obscureText),
    );
  }

  String? _helperText() {
    if (widget.helperText == null || widget.helperText!.isEmpty) return null;
    return widget.helperText;
  }
}
