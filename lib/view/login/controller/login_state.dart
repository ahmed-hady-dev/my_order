part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
//===============================================================

class LoginChangePasswordVisibilityState extends LoginState {}
//===============================================================

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {
  final UserModel userModel;

  LoginSuccessState({required this.userModel});
}

class LoginLErrorState extends LoginState {
  final String error;

  LoginLErrorState({required this.error});
}
//===============================================================
