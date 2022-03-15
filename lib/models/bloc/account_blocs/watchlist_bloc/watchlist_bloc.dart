import 'package:movies_task/models/bloc/account_blocs/watchlist_bloc/watchlist_bloc_event.dart';
import 'package:movies_task/models/bloc/account_blocs/watchlist_bloc/watchlist_bloc_state.dart';
import 'package:movies_task/models/bloc/closable_bloc.dart';
import 'package:movies_task/models/utilities/shared_preferences/shared_preferences.dart';
import 'package:movies_task/repository/network/movies/response/movies_api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';
import 'package:movies_task/repository/network/user/watch_list_movies/watch_list_movies_api_client.dart';

class WatchlistBloc
    extends ClosableBloc<WatchlistBlocEvent, WatchlistBlocState> {
  WatchlistBloc({WatchlistBlocState? initialState})
      : super(initialState ?? WatchlistIdle()) {
    on<WatchlistFetch>((event, emit) async {
      try {
        emit(WatchlistLoading());
        final WatchListMoviesApiClient _watchListMoviesApiClient =
            WatchListMoviesApiClient();
        SharedPreferences _localStorage = SharedPreferences.instance;
        final int? _accountId = await _localStorage.getUserLoggedInAccountId();
        final String? _sessionId =
            await _localStorage.getUserLoggedInSessionId();

        final MoviesApiResponse _result =
            await _watchListMoviesApiClient.getMovieWatchlist(
                accountId: _accountId!,
                apiKey: NetworkConstants.apiKey,
                sessionId: _sessionId!);

        if (_result.movies != null) {
          emit(WatchlistLoaded(_result.movies!));
        } else {
          emit(WatchlistLoadingError(reason: _result.statusMessage));
        }
      } catch (e) {
        emit(WatchlistLoadingError(reason: e.toString()));
      }
    });
  }
}
