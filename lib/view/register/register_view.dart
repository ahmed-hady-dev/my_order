// ignore_for_file: implementation_imports

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/home/home_view.dart';
import 'package:my_order/view/register/Controller/register_cubit.dart';
import 'package:my_order/view/register/Controller/register_state.dart';
import 'package:my_order/widgets/confirm_password_text_field.dart';
import 'package:my_order/widgets/email_text_field.dart';
import 'package:my_order/widgets/indicator_widget.dart';
import 'package:my_order/widgets/main_button.dart';
import 'package:my_order/widgets/first_name_text_field.dart';
import 'package:my_order/widgets/password_text_field.dart';
import 'package:my_order/widgets/phone_text_field.dart';
import 'package:my_order/widgets/last_name_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("register.appBar_title".tr())),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterSuccessState) {
                if (state.userModel.tokenType == 'bearer') {
                  Fluttertoast.showToast(msg: "register.success".tr());
                  MagicRouter.navigateAndPopAll(const HomeView());
                } else if (state.userModel.errors!.email != null) {
                  Fluttertoast.showToast(
                      msg: state.userModel.errors!.email!.join());
                } else if (state.userModel.errors!.phone != null) {
                  Fluttertoast.showToast(
                      msg: state.userModel.errors!.phone!.join());
                }
              }
            },
            builder: (context, state) {
              final cubit = RegisterCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: AutoSizeText("login.continue_with_email".tr(),
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 24.0)),
                    ),
                    FirstNameTextField(
                      hintText: "register.first_name".tr(),
                      controller: cubit.firstNameController,
                      onFieldSubmitted: (value) {
                        if (cubit.formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(height: 12.0),
                    LastNameTextField(
                      hintText: "register.last_name".tr(),
                      controller: cubit.lastNameController,
                      onFieldSubmitted: (value) {
                        if (cubit.formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(height: 12.0),
                    EmailTextField(
                      hintText: "register.email".tr(),
                      controller: cubit.emailController,
                      onFieldSubmitted: (value) {
                        if (cubit.formKey.currentState!.validate()) {}
                      },
                    ),
                    const SizedBox(height: 12.0),
                    PhoneTextField(
                        hintText: "register.phone".tr(),
                        controller: cubit.phoneController,
                        onFieldSubmitted: (value) {
                          if (cubit.formKey.currentState!.validate()) {}
                        }),
                    const SizedBox(height: 12.0),
                    PasswordTextField(
                        hintText: "register.password".tr(),
                        controller: cubit.passwordController,
                        onFieldSubmitted: (value) {
                          if (cubit.formKey.currentState!.validate()) {}
                        },
                        obscureText: cubit.isPassword,
                        onPressed: () => cubit.changePasswordVisibility(),
                        icon: cubit.suffix),
                    const SizedBox(height: 12.0),
                    ConfirmPasswordTextField(
                        hintText: "register.confirm_password".tr(),
                        controller: cubit.confirmPasswordController,
                        onFieldSubmitted: (value) {
                          if (cubit.formKey.currentState!.validate()) {}
                        },
                        obscureText: cubit.isPasswordConfirm,
                        onPressed: () =>
                            cubit.changeConfirmPasswordVisibility(),
                        icon: cubit.suffixConfirm),
                    const SizedBox(height: 12.0),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: cubit.isChecked,
                            activeColor: AppColors.redColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) => cubit.changeCheckBox(value!)),
                        Expanded(
                          child: Text("register.checkbox_text".tr(),
                              maxLines: 2,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16.0)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    state is RegisterLoadingState
                        ? const IndicatorWidget()
                        : MainButton(
                            text: "login.create_account".tr(),
                            onPressed: () async {
                              if (cubit.passwordController.value.text !=
                                  cubit.confirmPasswordController.value.text) {
                                Fluttertoast.showToast(
                                    msg: "register.password_match".tr());
                              }
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.userSignUp(
                                    firstName: cubit.firstNameController.text,
                                    lastName: cubit.lastNameController.text,
                                    phone: cubit.phoneController.text,
                                    email: cubit.emailController.text
                                        .toLowerCase()
                                        .trim(),
                                    password: cubit.passwordController.text
                                        .toLowerCase()
                                        .trim(),
                                    passwordConfirm: cubit
                                        .confirmPasswordController.text
                                        .toLowerCase()
                                        .trim(),
                                    notifiToken: '123456');
                              }
                            },
                          ),
                    const SizedBox(height: 24.0),
                    Text("register.terms".tr(),
                        maxLines: 5,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14.0)),
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
