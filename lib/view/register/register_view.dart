// ignore_for_file: implementation_imports

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/home/home_view.dart';
import 'package:my_order/view/register/Controller/register_cubit.dart';
import 'package:my_order/view/register/Controller/register_state.dart';
import 'package:my_order/widgets/email_text_field.dart';
import 'package:my_order/widgets/main_button.dart';
import 'package:my_order/widgets/name_text_field.dart';
import 'package:my_order/widgets/password_text_field.dart';
import 'package:my_order/widgets/phone_text_field.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("register.appBar_title".tr())),
        body: BlocProvider(
          create: (context) => RegisterCubit(),
          child: BlocBuilder<RegisterCubit, RegisterState>(
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
                    NameTextField(
                      hintText: "register.name".tr(),
                      controller: cubit.nameController,
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
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: cubit.isChecked,
                            activeColor: AppColors.redColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onChanged: (value) => cubit.changeCheckBox(value)),
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
                    MainButton(
                      text: "login.create_account".tr(),
                      onPressed: () async {
                        if (cubit.formKey.currentState!.validate()) {
                          MagicRouter.navigateAndPopAll(const HomeView());
                        }
                      },
                    ),
                    const SizedBox(height: 24.0),
                    Expanded(
                      child: Text("register.terms".tr(),
                          maxLines: 5,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14.0)),
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
