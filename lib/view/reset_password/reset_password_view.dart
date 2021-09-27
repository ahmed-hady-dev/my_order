// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/home/home_view.dart';
import 'package:my_order/widgets/main_button.dart';
import 'package:my_order/widgets/password_text_field.dart';

import 'controller/reset_password_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("reset_password.appBar_title".tr())),
        body: BlocProvider(
          create: (context) => ResetPasswordCubit(),
          child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
              final cubit = ResetPasswordCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    PasswordTextField(
                        hintText: "reset_password.new_password".tr(),
                        controller: cubit.passwordController,
                        onFieldSubmitted: (value) {
                          if (cubit.formKey.currentState!.validate()) {}
                        },
                        obscureText: cubit.isPassword,
                        onPressed: () => cubit.changePasswordVisibility(),
                        icon: cubit.suffix),
                    const SizedBox(height: 12.0),
                    PasswordTextField(
                        hintText: "reset_password.confirm_new_password".tr(),
                        controller: cubit.confirmPasswordController,
                        onFieldSubmitted: (value) {
                          if (cubit.formKey.currentState!.validate()) {}
                        },
                        obscureText: cubit.isConfirmPassword,
                        onPressed: () =>
                            cubit.changeConfirmPasswordVisibility(),
                        icon: cubit.suffixConfirm),
                    const SizedBox(height: 12.0),
                    MainButton(
                      text: "reset_password.confirm".tr(),
                      onPressed: () async {
                        if (cubit.formKey.currentState!.validate()) {
                          if (cubit.passwordController.value.text !=
                              cubit.confirmPasswordController.value.text) {
                            Fluttertoast.showToast(
                                msg: "reset_password.make_sure".tr());
                          } else {
                            MagicRouter.navigateAndPopAll(const HomeView());
                          }
                        }
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
