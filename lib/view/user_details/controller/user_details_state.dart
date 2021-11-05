part of 'user_details_cubit.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class ChangePasswordVisibilityState extends UserDetailsState {}

//===============================================================
class ChangeCityDropDownState extends UserDetailsState {}

class ChangeAreaOfCityDropDownState extends UserDetailsState {}

//===============================================================
class UpdateUserAreaLoading extends UserDetailsState {}

class UpdateUserAreaSuccess extends UserDetailsState {
  final UserModel userModel;

  UpdateUserAreaSuccess({required this.userModel});
}

class UpdateUserAreaError extends UserDetailsState {
} //===============================================================

class RefreshUserLoading extends UserDetailsState {}

class RefreshUserSuccess extends UserDetailsState {
  final UserModel userModel;

  RefreshUserSuccess({required this.userModel});
}

class RefreshUserError extends UserDetailsState {}

//===============================================================
class GetCityLoading extends UserDetailsState {}

class GetCitySuccess extends UserDetailsState {
  final CityModel cityModel;

  GetCitySuccess({required this.cityModel});
}

class GetCityError extends UserDetailsState {}

//===============================================================
class GetAreaOfCityLoading extends UserDetailsState {}

class GetAreaOfCitySuccess extends UserDetailsState {
  final AreaOfCityModel areaOfCityModel;

  GetAreaOfCitySuccess({required this.areaOfCityModel});
}

class GetAreaOfCityError extends UserDetailsState {}

//===============================================================
class UploadUserImageLoadingState extends UserDetailsState {}

class UploadUserImageSuccessState extends UserDetailsState {
  final ImageUpdatedModel imageUpdatedModel;

  UploadUserImageSuccessState({required this.imageUpdatedModel});
}

class UploadUserImageErrorState extends UserDetailsState {}

//===============================================================
class UserDetailsUpdateLoadingState extends UserDetailsState {}

class UserDetailsUpdateSuccessState extends UserDetailsState {
  final UserModel userModel;

  UserDetailsUpdateSuccessState({required this.userModel});
}

class UserDetailsUpdateErrorState extends UserDetailsState {}
//===============================================================

class UserPasswordUpdateLoadingState extends UserDetailsState {}

class UserPasswordUpdateSuccessState extends UserDetailsState {
  final UpdatePasswordModel updatePasswordModel;

  UserPasswordUpdateSuccessState({required this.updatePasswordModel});
}

class UserPasswordUpdateErrorState extends UserDetailsState {}
