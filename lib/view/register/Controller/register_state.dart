import 'package:my_order/view/register/model/sign_up_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

//===============================================================
class RegisterChangePasswordVisibilityState extends RegisterState {}

//===============================================================
class RegisterChangeCheckBoxState extends RegisterState {}
//===============================================================

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final SignUpModel signUpModel;

  RegisterSuccessState({required this.signUpModel});
}

class RegisterLErrorState extends RegisterState {
  final String error;
  RegisterLErrorState({required this.error});
}
