// ignore_for_file: implementation_imports

import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/login/model/user_model.dart';
import 'package:my_order/view/register/model/area_of_city_model.dart';
import 'package:my_order/view/register/model/city_model.dart';
import 'package:my_order/view/user_details/model/image_updated_model.dart';
import '../../../constants/constants.dart';
import '../../../core/dioHelper/dio_helper.dart';
import '../model/update_password_model.dart';

part 'user_details_state.dart';

class UserDetailsCubit extends Cubit<UserDetailsState> {
  UserDetailsCubit() : super(UserDetailsInitial());
  static UserDetailsCubit get(context) => BlocProvider.of(context);
//===============================================================
  CityModel? cityModel;
  AreaOfCityModel? areaOfCityModel;
  UserModel? userModel;
  String? cityDropDownValue;
  String? areaOfCityDropDownValue;
  ImageUpdatedModel? imageUpdatedModel;
//---------------------------------------------
  UpdatePasswordModel? updatePasswordModel;
  XFile? image;
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
  changeCityDropDown({required String? value}) {
    cityDropDownValue = value;
    emit(ChangeCityDropDownState());
  }

  changeAreaOfCityDropDown({required String? value}) {
    areaOfCityDropDownValue = value;
    emit(ChangeAreaOfCityDropDownState());
  }

  //===============================================================
  Future<void> updateUserArea({required int areaId}) async {
    emit(UpdateUserAreaLoading());
    final response = await DioHelper.postData(url: update, data: {
      'first_name': CacheHelper.getUserInfo!.data!.firstName.toString(),
      'last_name': CacheHelper.getUserInfo!.data!.lastName.toString(),
      'email': CacheHelper.getUserInfo!.data!.email.toString(),
      'phone': CacheHelper.getUserInfo!.data!.phone.toString(),
      'area_id': areaId.toString(),
    });
    try {
      userModel = UserModel.fromJson(response.data);
      CacheHelper.cacheUserModel(userModel: userModel!);
      emit(UpdateUserAreaSuccess(userModel: userModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
      emit(UpdateUserAreaError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
      emit(UpdateUserAreaError());
    }
  } //===============================================================

  Future<void> refreshUserData() async {
    emit(RefreshUserLoading());
    final response = await DioHelper.getDataByToken(url: userData);
    try {
      userModel = UserModel.fromJson(response.data);
      CacheHelper.cacheUserModel(userModel: userModel!);
      emit(RefreshUserSuccess(userModel: userModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
      emit(RefreshUserError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
      emit(RefreshUserError());
    }
  }

  //===============================================================
  Future<void> getCity() async {
    emit(GetCityLoading());
    final response = await DioHelper.getData(
      url: cities,
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    try {
      cityModel = CityModel.fromJson(response.data);
      emit(GetCitySuccess(cityModel: cityModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetCityError());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetCityError());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
    }
  }

//===============================================================
  Future<void> getAreaOfCityById({required int areaId}) async {
    emit(GetAreaOfCityLoading());
    final response = await DioHelper.getData(
      url: areasOfCity + areaId.toString(),
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    debugPrint(response.data.toString());
    try {
      areaOfCityModel = AreaOfCityModel.fromJson(response.data);
      emit(GetAreaOfCitySuccess(areaOfCityModel: areaOfCityModel!));
      debugPrint(areaOfCityModel!.data.toString());
      debugPrint(areaOfCityModel!.message.toString());
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetAreaOfCityError());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetAreaOfCityError());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
    }
  }

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
  Future<void> updateUser({
    required String firstName,
    required String lastName,
    required String phone,
    required String email,
  }) async {
    emit(UserDetailsUpdateLoadingState());
    final response = await DioHelper.postData(url: update, data: {
      'first_name': firstName.trim(),
      'last_name': lastName.trim(),
      'email': email.trim(),
      'phone': phone.trim(),
      'area_id': CacheHelper.getUserInfo!.data!.area!.id.toString(),
    });
    try {
      userModel = UserModel.fromJson(response.data);
      CacheHelper.cacheUserModel(userModel: userModel!);
      emit(UserDetailsUpdateSuccessState(userModel: userModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
      emit(UserDetailsUpdateErrorState());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      Fluttertoast.showToast(msg: "change_password.some_error".tr());
      emit(UserDetailsUpdateErrorState());
    }
  }

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

//===============================================================
  Future<String> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.gallery);
    image = imageFile;
    return image!.path;
  }

  Future<dynamic> uploadUserImage({required String path}) async {
    emit(UploadUserImageLoadingState());
    final formData = FormData.fromMap({});
    formData.files
        .add(MapEntry('image', await MultipartFile.fromFile(image!.path)));
    final response = await DioHelper.postData(url: updateImage, data: formData);
    final updatedUserResponse = await DioHelper.getDataByToken(url: userData);
    try {
      imageUpdatedModel = ImageUpdatedModel.fromJson(response.data);
      userModel = UserModel.fromJson(updatedUserResponse.data);
      CacheHelper.cacheUserModel(userModel: userModel!);
      emit(UploadUserImageSuccessState(imageUpdatedModel: imageUpdatedModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(UploadUserImageErrorState());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(UploadUserImageErrorState());
    }
  }
}
