import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/main.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc_event.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:movies_task/ui/screens/home/movies_list_view/movies_list_view.dart';
import 'package:movies_task/ui/screens/home/watchlist_screen/watchlist_screen.dart';
import 'package:movies_task/ui/ui_helper.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'homeScreen';
  HomeScreen({Key? key}) : super(key: key);

  final bool _appBarCenterTitle = true;
  final Future<String?> _sessionId =
      SharedPreferences.instance.getUserLoggedInSessionId();

  @override
  Widget build(BuildContext context) {
    _setUpAfterBuild(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations(context).nowPlayingMovies),
        centerTitle: _appBarCenterTitle,
        actions: [_watchlistIconAction(context)],
      ),
      body: SafeArea(
        child: MoviesListView(),
      ),
    );
  }

  Widget _watchlistIconAction(BuildContext context) {
    final ColorScheme _colorScheme = UIHelper.getColorScheme(context);

    return FutureBuilder<String?>(
      future: _sessionId,
      builder: (BuildContext context, AsyncSnapshot<String?> snapshot) {
        if (snapshot.data != null) {
          return IconButton(
              icon: Icon(
                Icons.video_library_rounded,
                color: _colorScheme.background,
              ),
              onPressed: () => _watchlistIconOnPressed(context));
        }

        return const SizedBox.shrink();
      },
    );
  }

  void _watchlistIconOnPressed(BuildContext context) =>
      Navigator.pushNamed(context, WatchlistScreen.id);

  void _setUpAfterBuild(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _fetchMovies(context);
    });
  }

  void _fetchMovies(BuildContext context) {
    MoviesBloc _moviesBloc = context.read<MoviesBloc>();
    _moviesBloc
      ..isFetching = true
      ..add(MoviesFetch());
  }
}
