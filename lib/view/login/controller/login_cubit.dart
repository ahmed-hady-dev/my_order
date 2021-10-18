import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/view/login/model/login_model.dart';
import '../../../core/dioHelper/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
//===============================================================
  LoginModel? loginModel;
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
    final response = await DioHelper.postData(url: login, data: {
      'email': email,
      'password': password,
    });
    try {
      loginModel = LoginModel.fromJson(response.data);
      emit(LoginSuccessState(loginModel: loginModel!));
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
