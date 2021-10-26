import '../../login/model/user_model.dart';
import '../model/areas_model.dart';

abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

//===============================================================
class RegisterChangePasswordVisibilityState extends RegisterState {}

//===============================================================
class ChangeDropDownState extends RegisterState {}

//===============================================================
class RegisterChangeCheckBoxState extends RegisterState {}

//===============================================================
class GetAreaLoading extends RegisterState {}

class GetAreaSuccess extends RegisterState {
  final AreasModel areasModel;

  GetAreaSuccess({required this.areasModel});
}

class GetAreaError extends RegisterState {}

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
