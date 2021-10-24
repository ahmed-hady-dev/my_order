import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/dioHelper/dio_helper.dart';
import 'package:my_order/view/user_details/model/update_password_model.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsInitial());
  static UserDetailsCubit get(context) => BlocProvider.of(context);
//===============================================================
  UpdatePasswordModel? updatePasswordModel;
  bool isOldPassword = true;
  bool isNewPassword = true;
  bool isConfirmPassword = true;
  IconData oldPasswordSuffix = Icons.visibility_outlined;
  IconData newPasswordSuffix = Icons.visibility_outlined;
  IconData confirmPasswordSuffix = Icons.visibility_outlined;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
//===============================================================
  void changeOldPasswordVisibility() {
    isOldPassword = !isOldPassword;
    oldPasswordSuffix = isOldPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  void changeNewPasswordVisibility() {
    isNewPassword = !isNewPassword;
    newPasswordSuffix = isNewPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

  void changeConfirmPasswordVisibility() {
    isConfirmPassword = !isConfirmPassword;
    confirmPasswordSuffix = isConfirmPassword
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibilityState());
  }

//===============================================================
  updateUser({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  }) async {}
//===============================================================
  Future<void> updateUserPassword({
    required String oldPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    emit(UserPasswordUpdateLoadingState());
    final response = await DioHelper.postData(url: updatePassword, data: {
      'old_password': oldPassword,
      'password': newPassword,
      'password_confirmation': confirmNewPassword,
    });
    try {
      updatePasswordModel = UpdatePasswordModel.fromJson(response.data);
      emit(UserPasswordUpdateSuccessState(
          updatePasswordModel: updatePasswordModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(UserPasswordUpdateErrorState());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(UserPasswordUpdateErrorState());
    }
  }
}
