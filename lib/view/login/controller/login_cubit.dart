import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/dioHelper/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
//===============================================================
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//===============================================================
  void userLogin({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final response = await DioHelper.postData(url: '', data: {
      'email': email,
      'password': password,
    });
    try {
      emit(LoginSuccessState());
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      emit(LoginLErrorState(error: e.toString()));
    }
  }

//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(LoginChangePasswordVisibilityState());
  }
}
