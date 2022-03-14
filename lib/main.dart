import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc.dart';
import 'package:movies_task/models/bloc/settings_bloc/settings_bloc.dart';
import 'package:movies_task/models/bloc/settings_bloc/settings_bloc_state.dart';
import 'package:movies_task/models/bloc/user_bloc/user_bloc.dart';
import 'package:movies_task/models/utilities/language/languages.dart';
import 'package:movies_task/models/utilities/localizations/locales_constants.dart';
import 'package:movies_task/models/utilities/localizations/localizations_delegate.dart';
import 'package:movies_task/models/utilities/themes/theme_dark.dart';
import 'package:movies_task/models/utilities/themes/theme_light.dart';
import 'package:movies_task/ui/screens/authentication/login_screen.dart';
import 'package:movies_task/ui/screens/home/home_screen.dart';
import 'package:movies_task/ui/screens/splash_screen.dart';

final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "Main Navigator");

Languages appLocalizations(context) => Localizations.of(context, Languages);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (ctx) => SettingsBloc(),
        ),
        BlocProvider<UserBloc>(
          create: (ctx) => UserBloc(),
        ),
        BlocProvider<MoviesBloc>(
          create: (ctx) => MoviesBloc(),
        )
      ],
      child: BlocBuilder<SettingsBloc, SettingsBlocState>(
          builder: (context, state) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Movies',
          themeMode: state.settings!.theme,
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
          darkTheme: darkTheme,
          supportedLocales: LocalesConstants.supportedLocales,
          localizationsDelegates: const [
            AppLocalizationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          locale: state.settings!.locale,
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => const SplashScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            HomeScreen.id: (context) => const HomeScreen()
          },
        );
      }),
    );
  }
}
