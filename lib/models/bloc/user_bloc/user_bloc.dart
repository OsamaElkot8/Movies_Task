import 'package:movies_task/models/bloc/closable_bloc.dart';
import 'package:movies_task/models/bloc/user_bloc/user_bloc_event.dart';
import 'package:movies_task/models/bloc/user_bloc/user_bloc_state.dart';
import 'package:movies_task/models/entities/user/user.dart';
import 'package:movies_task/repository/network/api_response/api_response.dart';
import 'package:movies_task/repository/network/user/user_api_client.dart';

class UserBloc extends ClosableBloc<UserBlocEvent, UserBlocState> {
  UserBloc({UserBlocState? initialState}) : super(initialState ?? UserIdle()) {
    on<UserFetch>((event, emit) async {
      try {
        emit(UserLoading());
        final UserApiClient _userApiClient = UserApiClient();
        final ApiResponse<User> _result =
            await _userApiClient.getLoggedInUserData();
        if (_result.status == ApiStatus.success) {
          emit(UserLoaded(_result.data!));
        } else {
          emit(UserLoadingError(reason: _result.message?.values.first));
        }
      } catch (e) {
        emit(UserLoadingError(reason: e.toString()));
      }
    });

    on<UserEdit>((event, emit) async {
      try {
        emit(UserLoaded(event.user));
      } catch (e) {
        emit(UserLoadingError(reason: e.toString()));
      }
    });
  }
}
