part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class ChangeNotificationToggle extends SettingsState {}

class ChangeLangDropDown extends SettingsState {}

class ChangeCountryDropDown extends SettingsState {}
