// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';
import 'package:my_order/view/login/model/user_model.dart';
import '../../../core/dioHelper/dio_helper.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
//===============================================================
  UserModel? userModel;
  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//===============================================================
  Future<void> userLogin({
    required String email,
    required String password,
    String? notifiToken,
  }) async {
    emit(LoginLoadingState());
    final response = await DioHelper.postData(
      url: login,
      data: {
        'email': email,
        'password': password,
        'notifi_token': notifiToken,
      },
    );
    try {
      userModel = UserModel.fromJson(response.data);
      if (userModel!.accessToken != null)
        CacheHelper.cacheUserInfo(
            token: userModel!.accessToken!.toString(), userModel: userModel!);
      emit(LoginSuccessState(userModel: userModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
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
