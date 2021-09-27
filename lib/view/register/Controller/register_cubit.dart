import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order/core/dioHelper/dio_helper.dart';
import 'package:my_order/view/register/Controller/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
//===============================================================
  bool isPassword = true;
  bool? isChecked = false;
  IconData suffix = Icons.visibility_outlined;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

//===============================================================
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(RegisterChangePasswordVisibilityState());
  }

//===============================================================
  void changeCheckBox(bool? value) {
    isChecked = value;
    emit(RegisterChangeCheckBoxState());
  }

//===============================================================
  userSignUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    emit(RegisterLoadingState());
    final response = await DioHelper.postData(
      url: 'REGISTER',
      data: {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      },
    );
    try {
      final data = response.data;
      emit(RegisterSuccessState());
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      emit(RegisterLErrorState(error: e.toString()));
    }
  }
}
