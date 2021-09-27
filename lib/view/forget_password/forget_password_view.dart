// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/reset_password/reset_password_view.dart';
import 'package:my_order/widgets/email_text_field.dart';
import 'package:my_order/widgets/main_button.dart';

import 'controller/forget_password_cubit.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("forget_password.appBar_title".tr())),
        body: BlocProvider(
          create: (context) => ForgetPasswordCubit(),
          child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
            builder: (context, state) {
              final cubit = ForgetPasswordCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: EmailTextField(
                          hintText: "forget_password.email".tr(),
                          controller: cubit.emailController,
                          onFieldSubmitted: (value) {
                            if (cubit.formKey.currentState!.validate()) {}
                          }),
                    ),
                    MainButton(
                      text: "forget_password.reset_your_password".tr(),
                      onPressed: () async {
                        if (cubit.formKey.currentState!.validate()) {
                          MagicRouter.navigateTo(const ResetPasswordView());
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
