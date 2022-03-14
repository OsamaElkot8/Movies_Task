import 'package:movies_task/models/bloc/closable_bloc.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc_event.dart';
import 'package:movies_task/models/bloc/movies_bloc/movies_bloc_state.dart';
import 'package:movies_task/repository/network/movies/client/movies_api_client.dart';
import 'package:movies_task/repository/network/movies/response/movies_api_response.dart';
import 'package:movies_task/repository/network/network_constants.dart';

class MoviesBloc extends ClosableBloc<MoviesBlocEvent, MoviesBlocState> {
  MoviesBloc({MoviesBlocState? initialState})
      : super(initialState ?? MoviesIdle()) {
    on<MoviesFetch>((event, emit) async {
      try {
        emit(MoviesLoading());
        final MoviesApiClient _moviesApiClient = MoviesApiClient();
        final MoviesApiResponse _result = await _moviesApiClient
            .getNowPlayingMovies(apiKey: NetworkConstants.apiKey, page: _page);

        if (_result.movies != null) {
          emit(MoviesLoaded(_result.movies!));
          _page++;
        } else {
          emit(MoviesLoadingError(reason: _result.statusMessage));
        }
      } catch (e) {
        emit(MoviesLoadingError(reason: e.toString()));
      }
    });
  }
  int _page = 1;
  bool isFetching = false;
}
