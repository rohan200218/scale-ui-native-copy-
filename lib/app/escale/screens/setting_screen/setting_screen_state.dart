part of 'setting_screen_cubit.dart';

@freezed
class SettingScreenState with _$SettingScreenState {
  const factory SettingScreenState.initial({
    @Default(false) bool lotSize,
    @Default(false) bool farmerName,
}) = _Initial;
}
