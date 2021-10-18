import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/getStorageHelper/get_storage_helper.dart';
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
      await GetStorageHelper.storage
          .write(userId, loginModel!.data!.id.toString());
      await GetStorageHelper.storage
          .write(userToken, loginModel!.accessToken.toString());
      await GetStorageHelper.storage
          .write(userEmail, loginModel!.data!.email.toString());
      await GetStorageHelper.storage
          .write(userPhone, loginModel!.data!.phone.toString());
      await GetStorageHelper.storage
          .write(userImage, loginModel!.data!.image.toString());
      await GetStorageHelper.storage
          .write(userFirstName, loginModel!.data!.firstName.toString());
      await GetStorageHelper.storage
          .write(userLastName, loginModel!.data!.lastName.toString());
      await GetStorageHelper.storage
          .write(areaId, loginModel!.data!.area!.id.toString());
      await GetStorageHelper.storage
          .write(areaName, loginModel!.data!.area!.name.toString());
      await GetStorageHelper.storage
          .write(cityId, loginModel!.data!.area!.city!.id.toString());
      await GetStorageHelper.storage
          .write(cityName, loginModel!.data!.area!.city!.name.toString());

      emit(LoginSuccessState(loginModel: loginModel!));
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
