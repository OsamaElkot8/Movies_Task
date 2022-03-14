import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:movies_task/main.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:movies_task/ui/screens/authentication/login_screen.dart';
import 'package:movies_task/ui/screens/home/home_screen.dart';
import 'package:movies_task/ui/ui_helper.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splashScreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _setUpAfterBuild(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(appLocalizations(context).movies,
                  textStyle: UIHelper.getTextTheme(context).headline1)
            ],
            repeatForever: true,
          ),
        ),
      ),
    );
  }

  void _setUpAfterBuild(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _userAuthentication(context);
    });
  }

  void _userAuthentication(BuildContext context) async {
    if (await _isUserLoggedIn()) {
      Navigator.pushNamedAndRemoveUntil(
          navigatorKey.currentContext!, HomeScreen.id, (_) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          navigatorKey.currentContext!, LoginScreen.id, (_) => false);
    }
  }

  Future<bool> _isUserLoggedIn() async {
    final SharedPreferences _localStorage = SharedPreferences.instance;
    return (await _localStorage.getUserLoggedInSessionId()) != null;
  }
}
