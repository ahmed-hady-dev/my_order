// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/user_details/controller/user_details_cubit.dart';
import 'package:my_order/widgets/header_text.dart';
import 'package:my_order/widgets/loading_dialog.dart';
import 'package:my_order/widgets/main_button.dart';

class UserDetailsForm extends StatelessWidget {
  const UserDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        final cubit = UserDetailsCubit.get(context);
        cubit.firstNameController.text =
            CacheHelper.getUserInfo!.data!.firstName!.toString();
        cubit.lastNameController.text =
            CacheHelper.getUserInfo!.data!.lastName!.toString();
        cubit.emailController.text =
            CacheHelper.getUserInfo!.data!.email!.toString();
        cubit.phoneController.text =
            CacheHelper.getUserInfo!.data!.phone!.toString();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText(text: "user_details.first_name".tr()),
                        TextFormField(
                            keyboardType: TextInputType.text,
                            controller: cubit.firstNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "validation.first_name".tr();
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "user_details.first_name".tr())),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        HeaderText(text: "user_details.last_name".tr()),
                        TextFormField(
                            keyboardType: TextInputType.text,
                            controller: cubit.lastNameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "validation.last_name".tr();
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                hintText: "user_details.last_name".tr())),
                      ],
                    ),
                  ),
                ],
              ),
              HeaderText(text: "user_details.email".tr()),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: cubit.emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "validation.email_empty".tr();
                    } else if (!value.contains('@')) {
                      return "validation.email_valid".tr();
                    } else {
                      return null;
                    }
                  },
                  decoration:
                      InputDecoration(hintText: "user_details.email".tr())),
              HeaderText(text: "user_details.phone_number".tr()),
              TextFormField(
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "validation.phone_empty".tr();
                    } else if (value.length != 11) {
                      return "validation.phone_valid".tr();
                    } else {
                      return null;
                    }
                  },
                  controller: cubit.phoneController,
                  decoration: InputDecoration(
                      hintText: "user_details.phone_number".tr())),
              const SizedBox(height: 12.0),
              MainButton(
                text: "user_details.edit".tr(),
                onPressed: () async {
                  if (cubit.formKey.currentState!.validate()) {
                    loadingDialog(context);
                    await cubit
                        .updateUser(
                            firstName: cubit.firstNameController.text,
                            lastName: cubit.lastNameController.text,
                            phone: cubit.phoneController.text,
                            email: cubit.emailController.text)
                        .then((value) => MagicRouter.pop());
                  }
                },
              )
            ],
          ),
        );
      },
    );
  }
}
