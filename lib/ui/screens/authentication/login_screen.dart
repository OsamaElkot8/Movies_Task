import 'package:flutter/material.dart';
import 'package:movies_task/main.dart';
import 'package:movies_task/models/entities/user/user.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/authentication/authentication_api_client.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:movies_task/repository/network/user/user_client/user_api_client.dart';
import 'package:movies_task/ui/components/buttons/default_colorless_button.dart';
import 'package:movies_task/ui/components/buttons/default_text_button.dart';
import 'package:movies_task/ui/components/custom_single_child_scroll_view.dart';
import 'package:movies_task/ui/components/text_fields/default_text_field.dart';
import 'package:movies_task/ui/screens/home/home_screen.dart';
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
  final UserApiClient _userApiClient = UserApiClient();

  final TextEditingController _usernameController = TextEditingController(),
      _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final SharedPreferences _localStorage = SharedPreferences.instance;

  String? _authenticationError;

  bool _isLoginButtonLoading = false;

  void _loginButtonLoadingOn() => setState(() => _isLoginButtonLoading = true);
  void _loginButtonLoadingOff() =>
      setState(() => _isLoginButtonLoading = false);

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
                  controller: _usernameController,
                  label: appLocalizations(context).username,
                  validator: _usernameValidator,
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
                    isLoading: _isLoginButtonLoading,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                DefaultColorlessButton(
                    onPressed: _skipButtonOnPressed,
                    child: Text(appLocalizations(context).skip)),
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

  String? _usernameValidator(String? value) {
    if (_authenticationError != null) {
      return UiConstants.stringEmpty;
    } else {
      return null;
    }
  }

  String? _passwordValidator(String? value) {
    return _authenticationError;
  }

  void _loginButtonOnPressed() async {
    _loginButtonLoadingOn();

    ApiResponse _requestTokenResult = await _authenticationApiClient
        .createRequestToken(apiKey: NetworkConstants.apiKey);

    if (_requestTokenResult.success == null || !_requestTokenResult.success!) {
      _loginButtonLoadingOff();
      _setValidationError(error: _requestTokenResult.statusMessage);
      return;
    }

    ApiResponse _validateLoginResult =
        await _validateLogin(requestToken: _requestTokenResult.requestToken!);

    if (_validateLoginResult.success == null ||
        !_validateLoginResult.success!) {
      _loginButtonLoadingOff();
      _setValidationError(error: _validateLoginResult.statusMessage);
      return;
    }

    ApiResponse _createSessionResult =
        await _createSession(requestToken: _validateLoginResult.requestToken!);

    if (_createSessionResult.success == null ||
        !_createSessionResult.success!) {
      _loginButtonLoadingOff();
      _setValidationError(error: _createSessionResult.statusMessage);
      return;
    }

    User _accountDetailsResult = await _userApiClient.getAccountDetails(
        sessionId: _createSessionResult.sessionId!,
        apiKey: NetworkConstants.apiKey);

    if (_accountDetailsResult.id == null) {
      _loginButtonLoadingOff();
      _setValidationError(error: _accountDetailsResult.statusMessage);
      return;
    }

    await _localStorage
        .setUserLoggedInSessionId(_createSessionResult.sessionId!);
    await _localStorage.setUserLoggedInAccountId(_accountDetailsResult.id!);
    _navigateToHomeScreen();
  }

  Future<ApiResponse> _validateLogin({required String requestToken}) async {
    String _username = _usernameController.text,
        _password = _passwordController.text;

    Map<String, dynamic> _validateLoginBody = {
      NetworkConstants.keyUsername: _username,
      NetworkConstants.keyPassword: _password,
      NetworkConstants.keyRequestToken: requestToken
    };
    ApiResponse _result = await _authenticationApiClient.validateLogin(
        body: _validateLoginBody, apiKey: NetworkConstants.apiKey);

    return _result;
  }

  Future<ApiResponse> _createSession({required String requestToken}) async {
    Map<String, dynamic> _createSessionBody = {
      NetworkConstants.keyRequestToken: requestToken
    };
    ApiResponse _result = await _authenticationApiClient.createSession(
        body: _createSessionBody, apiKey: NetworkConstants.apiKey);

    return _result;
  }

  void _setValidationError({String? error}) {
    _authenticationError = error;
    _validateTextFields();
  }

  void _skipButtonOnPressed() => _navigateToHomeScreen();

  void _navigateToHomeScreen() => Navigator.pushNamedAndRemoveUntil(
      navigatorKey.currentContext!, HomeScreen.id, (_) => false);

  bool _validateTextFields() => _formKey.currentState!.validate();
}
