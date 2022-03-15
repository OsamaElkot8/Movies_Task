import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/main.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc_event.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc_state.dart';
import 'package:movies_task/models/entities/movie/movie.dart';
import 'package:movies_task/ui/screens/home/movies_list_view/movie_view.dart';
import 'package:movies_task/ui/screens/home/movies_list_view/watchlist_add_icon_view.dart';
import 'package:movies_task/ui/ui_helper.dart';

class MoviesListView extends StatelessWidget {
  MoviesListView({Key? key}) : super(key: key);

  final List<Movie> _movies = [];
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesBloc, MoviesBlocState>(
      listener: (context, state) {
        String? _snackBarMessage;
        switch (state.runtimeType) {
          case MoviesIdle:
          case MoviesLoading:
            _snackBarMessage = appLocalizations(context).loading;
            break;
          case MoviesLoaded:
            final casted = state as MoviesLoaded;
            final List<Movie> _moviesPerPage = casted.movies;
            if (_moviesPerPage.isEmpty) {
              _snackBarMessage = appLocalizations(context).noMoreMovies;
            }
            break;
          case MoviesLoadingError:
          default:
            _snackBarMessage = appLocalizations(context).errorGettingMovies;
            MoviesBloc _moviesBloc = context.read<MoviesBloc>();
            _moviesBloc.isFetching = false;
            break;
        }

        if (_snackBarMessage != null) {
          UIHelper.showSnackBarMessage(context, message: _snackBarMessage);
        }
      },
      builder: (context, state) {
        if (state is MoviesIdle || state is MoviesLoading && _movies.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MoviesLoaded) {
          MoviesBloc _moviesBloc = context.read<MoviesBloc>();
          _moviesBloc.isFetching = false;

          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          final List<Movie> _moviesPerPage = state.movies;
          _movies.addAll(_moviesPerPage);
        } else if (state is MoviesLoadingError && _movies.isEmpty) {
          return Center(
            child: _fetchMoviesErrorView(context, error: state.reason!),
          );
        }

        const EdgeInsets _listViewPadding = EdgeInsets.all(20.0);

        return ListView.separated(
          padding: _listViewPadding,
          controller: _scrollController
            ..addListener(() => _scrollControllerListener(context)),
          itemBuilder: (context, index) {
            final Movie _singleMovie = _movies[index];
            const double _positionedWatchListItemTop = 10.0;
            const double _positionedWatchListItemRight = 10.0;

            return Stack(
              children: [
                MovieView(movie: _singleMovie),
                Positioned(
                    top: _positionedWatchListItemTop,
                    right: _positionedWatchListItemRight,
                    child: WatchlistAddIconView(mediaId: _singleMovie.id))
              ],
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 20),
          itemCount: _movies.length,
        );
      },
    );
  }

  void _scrollControllerListener(BuildContext context) {
    MoviesBloc _moviesBloc = context.read<MoviesBloc>();

    if (_scrollController.offset ==
            _scrollController.position.maxScrollExtent &&
        !_moviesBloc.isFetching) {
      _fetchMovies(context);
    }
  }

  Widget _fetchMoviesErrorView(BuildContext context, {required String error}) =>
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _fetchMovies(context),
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(height: 15),
          Text(error, textAlign: TextAlign.center),
        ],
      );

  void _fetchMovies(BuildContext context) {
    MoviesBloc _moviesBloc = context.read<MoviesBloc>();
    _moviesBloc
      ..isFetching = true
      ..add(MoviesFetch());
  }
}
