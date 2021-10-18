import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/getStorageHelper/get_storage_helper.dart';
import 'package:my_order/view/register/model/sign_up_model.dart';
import '../../../core/dioHelper/dio_helper.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
//===============================================================
  SignUpModel? signUpModel;
  bool isPassword = true;
  bool isPasswordConfirm = true;
  bool isChecked = false;
  IconData suffix = Icons.visibility_outlined;
  IconData suffixConfirm = Icons.visibility_outlined;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

//===============================================================
  void changeConfirmPasswordVisibility() {
    isPasswordConfirm = !isPasswordConfirm;
    suffixConfirm = isPasswordConfirm
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

//===============================================================
  void changeCheckBox(bool value) {
    isChecked = value;
    emit(RegisterChangeCheckBoxState());
  }

//===============================================================
  Future userSignUp({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirm,
    //TODO: add the area id here
    int? registerAreaId,
  }) async {
    emit(RegisterLoadingState());
    final response = await DioHelper.postData(
      url: signUp,
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirm,
        'area_id': registerAreaId ?? 1,
      },
    );
    try {
      signUpModel = SignUpModel.fromJson(response.data as Map<String, dynamic>);
      await GetStorageHelper.storage
          .write(userId, signUpModel!.data!.id.toString());
      await GetStorageHelper.storage
          .write(userToken, signUpModel!.accessToken.toString());
      await GetStorageHelper.storage
          .write(userEmail, signUpModel!.data!.email.toString());
      await GetStorageHelper.storage
          .write(userPhone, signUpModel!.data!.phone.toString());
      await GetStorageHelper.storage
          .write(userImage, signUpModel!.data!.image.toString());
      await GetStorageHelper.storage
          .write(userFirstName, signUpModel!.data!.firstName.toString());
      await GetStorageHelper.storage
          .write(userLastName, signUpModel!.data!.lastName.toString());
      await GetStorageHelper.storage
          .write(areaId, signUpModel!.data!.area!.id.toString());
      await GetStorageHelper.storage
          .write(areaName, signUpModel!.data!.area!.name.toString());
      await GetStorageHelper.storage
          .write(cityId, signUpModel!.data!.area!.city!.id.toString());
      await GetStorageHelper.storage
          .write(cityName, signUpModel!.data!.area!.city!.name.toString());

      emit(RegisterSuccessState(signUpModel: signUpModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(RegisterLErrorState(error: e.toString()));
    } catch (e) {
      debugPrint(e.toString());
      emit(RegisterLErrorState(error: e.toString()));
    }
  }
}
