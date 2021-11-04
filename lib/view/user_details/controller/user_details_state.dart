part of 'user_details_cubit.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class ChangePasswordVisibilityState extends UserDetailsState {}

//===============================================================
class UploadUserImageLoadingState extends UserDetailsState {}

class UploadUserImageSuccessState extends UserDetailsState {}

class UploadUserImageErrorState extends UserDetailsState {}

//===============================================================
class UserDetailsUpdateLoadingState extends UserDetailsState {}

class UserDetailsUpdateSuccessState extends UserDetailsState {}

class UserDetailsUpdateErrorState extends UserDetailsState {}
//===============================================================

class UserPasswordUpdateLoadingState extends UserDetailsState {}

class UserPasswordUpdateSuccessState extends UserDetailsState {
  final UpdatePasswordModel updatePasswordModel;

  UserPasswordUpdateSuccessState({required this.updatePasswordModel});
}

class UserPasswordUpdateErrorState extends UserDetailsState {}
