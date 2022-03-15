import 'package:movies_task/models/entities/movie/movie.dart';
import 'package:movies_task/repository/network/network_constants.dart';

abstract class WatchlistBlocState {}

class WatchlistIdle extends WatchlistBlocState {}

class WatchlistLoading extends WatchlistBlocState {}

class WatchlistLoaded extends WatchlistBlocState {
  final List<Movie> movies;
  WatchlistLoaded(this.movies);
}

class WatchlistLoadingError extends WatchlistBlocState {
  String? reason;
  WatchlistLoadingError({this.reason = NetworkConstants.keyError});
}
