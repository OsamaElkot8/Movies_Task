import 'package:movies_task/models/entities/user/user.dart';
import 'package:movies_task/repository/network/network_constants.dart';

abstract class UserBlocState {}

class UserIdle extends UserBlocState {}

class UserLoading extends UserBlocState {}

class UserLoaded extends UserBlocState {
  final User user;
  UserLoaded(this.user);
}

class UserLoadingError extends UserBlocState {
  String? reason;
  UserLoadingError({this.reason = NetworkConstants.keyError});
}
