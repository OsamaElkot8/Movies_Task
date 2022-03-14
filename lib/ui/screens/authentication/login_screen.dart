import 'package:flutter/material.dart';
import 'package:movies_task/main.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:movies_task/repository/network/authentication/authentication_api_client.dart';
import 'package:movies_task/ui/components/custom_single_child_scroll_view.dart';
import 'package:movies_task/ui/components/default_text_button.dart';
import 'package:movies_task/ui/components/default_text_field.dart';
import 'package:movies_task/ui/ui_constants.dart';
import 'package:movies_task/ui/ui_helper.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'loginScreen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final EdgeInsetsGeometry _screenPadding =
      const EdgeInsets.symmetric(horizontal: 20.0);

  final EdgeInsetsGeometry _buttonPadding =
      const EdgeInsets.symmetric(horizontal: 20.0);

  final AuthenticationApiClient _authenticationApiClient =
      AuthenticationApiClient();

  final TextEditingController _emailController = TextEditingController(),
      _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final SharedPreferences _localStorage = SharedPreferences.instance;

  String? _authenticationError;

  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = UIHelper.getTextTheme(context);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: CustomSingleChildScrollView(
          padding: _screenPadding,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  appLocalizations(context).welcomeBack +
                      UiConstants.stringExclamationMark,
                  style: _textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                DefaultTextField(
                  controller: _emailController,
                  label: appLocalizations(context).email,
                  validator: _emailValidator,
                ),
                const SizedBox(
                  height: 40.0,
                ),
                DefaultTextField(
                  controller: _passwordController,
                  label: appLocalizations(context).password,
                  obscuringEnabled: true,
                  validator: _passwordValidator,
                ),
                const SizedBox(
                  height: 80.0,
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: _buttonPadding,
                  child: DefaultTextButton(
                    onPressed: _loginButtonOnPressed,
                    text: appLocalizations(context).login,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Expanded(flex: 4, child: SizedBox())
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _emailValidator(String? value) {
    if (_authenticationError != null) {
      return UiConstants.stringEmpty;
    } else {
      return null;
    }
  }

  String? _passwordValidator(String? value) {
    return _authenticationError;
  }

  _loginButtonOnPressed() async {}

  bool _validateTextFields() => _formKey.currentState!.validate();
}
