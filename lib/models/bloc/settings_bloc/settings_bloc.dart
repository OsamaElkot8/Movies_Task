import 'package:movies_task/models/bloc/closable_bloc.dart';
import 'package:movies_task/models/bloc/settings_bloc/settings_bloc_event.dart';
import 'package:movies_task/models/bloc/settings_bloc/settings_bloc_state.dart';
import 'package:movies_task/models/utilities/settings.dart';

class SettingsBloc extends ClosableBloc<SettingsBlocEvent, SettingsBlocState> {
  SettingsBloc({SettingsBlocState? initialState})
      : super(initialState ?? SettingsIdle()) {
    on<SettingsFetch>((event, emit) async {
      try {
        emit(SettingsLoading());
        final Settings _result =
            await Settings.getSettingsFromSharedPreferences();
        emit(SettingsLoaded(_result));
      } catch (e) {
        emit(SettingsLoadingError(reason: e.toString()));
      }
    });
  }
}
