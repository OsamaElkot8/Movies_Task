import 'package:movies_task/models/utilities/settings.dart';
import 'package:movies_task/repository/network/network_constants.dart';

abstract class SettingsBlocState {
  Settings? settings = Settings.defaultSettings();
}

class SettingsIdle extends SettingsBlocState {}

class SettingsLoading extends SettingsBlocState {}

class SettingsLoaded extends SettingsBlocState {
  SettingsLoaded(settings) {
    this.settings = settings;
  }
}

class SettingsLoadingError extends SettingsBlocState {
  String? reason;
  SettingsLoadingError({this.reason = NetworkConstants.keyError});
}
