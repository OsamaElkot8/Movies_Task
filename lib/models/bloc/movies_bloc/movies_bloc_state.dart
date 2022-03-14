import 'package:movies_task/models/entities/movie/movie.dart';
import 'package:movies_task/repository/network/network_constants.dart';

abstract class MoviesBlocState {}

class MoviesIdle extends MoviesBlocState {}

class MoviesLoading extends MoviesBlocState {}

class MoviesLoaded extends MoviesBlocState {
  final List<Movie> movies;
  MoviesLoaded(this.movies);
}

class MoviesLoadingError extends MoviesBlocState {
  String? reason;
  MoviesLoadingError({this.reason = NetworkConstants.keyError});
}
