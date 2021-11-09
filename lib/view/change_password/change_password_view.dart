// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/change_password/component/old_password_text_field.dart';
import 'package:my_order/view/user_details/controller/user_details_cubit.dart';
import 'package:my_order/widgets/confirm_password_text_field.dart';
import 'package:my_order/widgets/header_text.dart';
import 'package:my_order/widgets/loading_widget.dart';
import 'package:my_order/widgets/main_button.dart';

import 'component/new_password_text_field.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserDetailsCubit, UserDetailsState>(
        listener: (context, state) {
          if (state is UserPasswordUpdateSuccessState) {
            if (state.updatePasswordModel.status! == 1) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("change_password.password_update_success".tr()),
                  backgroundColor: Colors.green,
                ),
              );
              MagicRouter.pop();
            } else if (state.updatePasswordModel.status! == 0) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.updatePasswordModel.message.toString()),
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              Fluttertoast.showToast(msg: "change_password.some_error".tr());
            }
          }
        },
        builder: (context, state) {
          final cubit = UserDetailsCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text("change_password.appBar_title".tr())),
            body: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                Form(
                    key: cubit.passwordFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText(text: "change_password.old_password".tr()),
                        OldPasswordTextField(
                            hintText: "change_password.old_password".tr(),
                            controller: cubit.oldPasswordController,
                            onFieldSubmitted: (value) {
                              if (cubit.passwordFormKey.currentState!
                                  .validate()) {}
                            },
                            obscureText: cubit.isOldPassword,
                            onPressed: () =>
                                cubit.changeOldPasswordVisibility(),
                            icon: cubit.oldPasswordSuffix),
                        HeaderText(text: "change_password.new_password".tr()),
                        NewPasswordTextField(
                            hintText: "change_password.new_password".tr(),
                            controller: cubit.newPasswordController,
                            onFieldSubmitted: (value) {
                              if (cubit.passwordFormKey.currentState!
                                  .validate()) {}
                            },
                            obscureText: cubit.isNewPassword,
                            onPressed: () =>
                                cubit.changeNewPasswordVisibility(),
                            icon: cubit.newPasswordSuffix),
                        HeaderText(
                            text: "change_password.confirm_new_password".tr()),
                        ConfirmPasswordTextField(
                            hintText:
                                "change_password.confirm_new_password".tr(),
                            controller: cubit.confirmPasswordController,
                            onFieldSubmitted: (value) {
                              if (cubit.passwordFormKey.currentState!
                                  .validate()) {}
                            },
                            obscureText: cubit.isConfirmPassword,
                            onPressed: () =>
                                cubit.changeConfirmPasswordVisibility(),
                            icon: cubit.confirmPasswordSuffix),
                      ],
                    )),
                const SizedBox(height: 24.0),
                state is UserPasswordUpdateLoadingState
                    ? const LoadingWidget()
                    : MainButton(
                        text: "change_password.change_password".tr(),
                        onPressed: () {
                          if (cubit.newPasswordController.value.text !=
                              cubit.confirmPasswordController.value.text) {
                            Fluttertoast.showToast(
                                msg: "register.password_match".tr());
                          } else if (cubit.passwordFormKey.currentState!
                              .validate()) {
                            cubit.updateUserPassword(
                                oldPassword: cubit.oldPasswordController.text,
                                newPassword: cubit.newPasswordController.text,
                                confirmNewPassword:
                                    cubit.confirmPasswordController.text);
                          }
                        }),
              ],
            ),
          );
        },
      ),
    );
  }
}
