import '../model/area_of_city_model.dart';
import '../model/city_model.dart';

import '../../login/model/user_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

//===============================================================
class RegisterChangePasswordVisibilityState extends RegisterState {}

//===============================================================
class ChangeCityDropDownState extends RegisterState {}

class ChangeAreaOfCityDropDownState extends RegisterState {}

//===============================================================
class RegisterChangeCheckBoxState extends RegisterState {}

//===============================================================
class GetCityLoading extends RegisterState {}

class GetCitySuccess extends RegisterState {
  final CityModel cityModel;

  GetCitySuccess({required this.cityModel});
}

class GetCityError extends RegisterState {}

//===============================================================
class GetAreaOfCityLoading extends RegisterState {}

class GetAreaOfCitySuccess extends RegisterState {
  final AreaOfCityModel areaOfCityModel;

  GetAreaOfCitySuccess({required this.areaOfCityModel});
}

class GetAreaOfCityError extends RegisterState {}

//===============================================================

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final UserModel userModel;

  RegisterSuccessState({required this.userModel});
}

class RegisterLErrorState extends RegisterState {
  final String error;
  RegisterLErrorState({required this.error});
}
