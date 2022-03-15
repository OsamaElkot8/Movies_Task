import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_task/main.dart';
import 'package:movies_task/models/bloc/account_blocs/watchlist_bloc/watchlist_bloc.dart';
import 'package:movies_task/models/bloc/account_blocs/watchlist_bloc/watchlist_bloc_event.dart';
import 'package:movies_task/models/bloc/account_blocs/watchlist_bloc/watchlist_bloc_state.dart';
import 'package:movies_task/models/entities/movie/movie.dart';
import 'package:movies_task/ui/screens/home/movies_list_view/movie_view.dart';
import 'package:movies_task/ui/screens/home/watchlist_screen/watchlist_remove_icon_view.dart';
import 'package:movies_task/ui/ui_constants.dart';

class WatchlistScreen extends StatefulWidget {
  static const String id = 'wishlistScreen';
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  final bool _appBarCenterTitle = true;
  final EdgeInsets _listViewPadding = const EdgeInsets.all(20.0);

  @override
  void initState() {
    _fetchWatchlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appLocalizations(context).watchlist),
        centerTitle: _appBarCenterTitle,
      ),
      body: SafeArea(
        child: BlocBuilder<WatchlistBloc, WatchlistBlocState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case WatchlistIdle:
              case WatchlistLoading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case WatchlistLoaded:
                final casted = state as WatchlistLoaded;
                final _watchlistMovies = casted.movies;

                if (_watchlistMovies.isNotEmpty) {
                  return ListView.separated(
                    padding: _listViewPadding,
                    itemBuilder: (context, index) {
                      final Movie _singleMovie = _watchlistMovies[index];
                      const double _positionedWatchListItemTop = 10.0;
                      const double _positionedWatchListItemLeft = 10.0;

                      return Stack(
                        children: [
                          MovieView(movie: _singleMovie),
                          Positioned(
                              top: _positionedWatchListItemTop,
                              left: _positionedWatchListItemLeft,
                              child: WatchlistRemoveIconView(
                                  mediaId: _singleMovie.id))
                        ],
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: _watchlistMovies.length,
                  );
                } else {
                  return Center(
                    child: Text(appLocalizations(context).noWatchlistMoviesYet +
                        UiConstants.stringExclamationMark),
                  );
                }

              case WatchlistLoadingError:
              default:
                final casted = state as WatchlistLoadingError;
                return Center(
                  child: Text(casted.reason!),
                );
            }
          },
        ),
      ),
    );
  }

  void _fetchWatchlist() {
    final _watchlistBloc = context.read<WatchlistBloc>();
    // getting logged in user watchlist
    _watchlistBloc.add(WatchlistFetch());
  }
}
