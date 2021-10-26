// ignore_for_file: curly_braces_in_flow_control_structures, implementation_imports

import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/login/model/user_model.dart';
import 'package:my_order/view/register/model/areas_model.dart';
import '../../../core/dioHelper/dio_helper.dart';
import 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
//===============================================================
  UserModel? userModel;
  AreasModel? areasModel;
  String? dropDownValue;
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
  changeDropDown({required String? value}) {
    dropDownValue = value;
    emit(ChangeDropDownState());
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
  Future<void> getArea() async {
    emit(GetAreaLoading());
    final response = await DioHelper.getData(
      url: areas,
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    try {
      areasModel = AreasModel.fromJson(response.data);
      emit(GetAreaSuccess(areasModel: areasModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetAreaError());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetAreaError());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
    }
  }

//===============================================================
  Future<void> userSignUp({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
    required String password,
    required String passwordConfirm,
    required int registerAreaId,
    //TODO: add the notifiToken here
    String? notifiToken,
  }) async {
    emit(RegisterLoadingState());
    final response = await DioHelper.postData(
      url: signUp,
      data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email.toLowerCase(),
        'phone': phone,
        'password': password,
        'password_confirmation': passwordConfirm,
        'area_id': registerAreaId,
        'notifi_token': notifiToken,
      },
    );
    try {
      userModel = UserModel.fromJson(response.data as Map<String, dynamic>);
      if (userModel!.accessToken != null)
        CacheHelper.cacheUserInfo(
            token: userModel!.accessToken!.toString(), userModel: userModel!);

      emit(RegisterSuccessState(userModel: userModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(RegisterLErrorState(error: e.toString()));
    } catch (e) {
      debugPrint(e.toString());
      emit(RegisterLErrorState(error: e.toString()));
    }
  }
}
