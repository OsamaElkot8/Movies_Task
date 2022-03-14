import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/main.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc_event.dart';
import 'package:movies_task/ui/screens/home/movies_list_view/movies_list_view.dart';

class HomeScreen extends StatelessWidget {
  static const String id = 'homeScreen';
  const HomeScreen({Key? key}) : super(key: key);

  final bool _appBarCenterTitle = true;

  @override
  Widget build(BuildContext context) {
    _setUpAfterBuild(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations(context).nowPlayingMovies),
        centerTitle: _appBarCenterTitle,
      ),
      body: SafeArea(
        child: MoviesListView(),
      ),
    );
  }

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
