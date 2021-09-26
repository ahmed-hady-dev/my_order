import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  static SettingsCubit get(context) => BlocProvider.of(context);
  //===============================================================
  bool notificationToggle = true;
  String langDropdownValue = 'English';
  String countryDropdownValue = 'EG';
  List<String> langList = ['English', 'العربية'];
  List<String> countryList = ['EG', 'US'];
  //===============================================================
  changeNotificationToggle({required bool value}) {
    notificationToggle = value;
    //TODO: add toggle notification function here
    emit(ChangeNotificationToggle());
  }

  //===============================================================
  changeLangDropDown({required String value}) {
    langDropdownValue = value;
    //TODO: add function here
    emit(ChangeLangDropDown());
  }

  //===============================================================
  changeCountryDropDown({required String value}) {
    countryDropdownValue = value;
    //TODO: add function here
    emit(ChangeCountryDropDown());
  }
  //===============================================================
}
