abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

//===============================================================
class RegisterChangePasswordVisibilityState extends RegisterState {}

//===============================================================
class RegisterChangeCheckBoxState extends RegisterState {}
//===============================================================

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {}

class RegisterLErrorState extends RegisterState {
  final String error;
  RegisterLErrorState({required this.error});
}
