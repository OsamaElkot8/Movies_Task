import 'package:movies_task/models/entities/user/user.dart';

abstract class UserBlocEvent {}

class UserFetch extends UserBlocEvent {}

class UserEdit extends UserBlocEvent {
  final User user;
  UserEdit(this.user);
}
