import 'package:my_order/view/login/model/user_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

//===============================================================
class RegisterChangePasswordVisibilityState extends RegisterState {}

//===============================================================
class RegisterChangeCheckBoxState extends RegisterState {}
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
