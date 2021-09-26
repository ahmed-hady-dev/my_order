// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/view/user_details/controller/user_details_cubit.dart';
import 'package:my_order/widgets/header_text.dart';

class UserDetailsForm extends StatelessWidget {
  const UserDetailsForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        final cubit = UserDetailsCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              HeaderText(
                text: "user_details.full_name".tr(),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: cubit.nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'name must not be empty';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (value) {
                  if (cubit.formKey.currentState!.validate()) {}
                },
                decoration: const InputDecoration(
                  //TODO: add the user name form api here
                  hintText: 'Ahmed Abd-ElHady',
                ),
              ),
              HeaderText(
                text: "user_details.email".tr(),
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: cubit.emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'email must not be empty';
                  } else if (!value.contains('@')) {
                    return 'please enter a valid email';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (value) {
                  if (cubit.formKey.currentState!.validate()) {}
                },
                decoration:
                    //TODO: add the user email form api here
                    const InputDecoration(hintText: 'User@yahoo.com'),
              ),
              HeaderText(
                text: "user_details.phone_number".tr(),
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'phone must not be empty';
                  } else if (value.startsWith('01')) {
                    return 'please enter a valid number';
                  } else if (value.length != 11) {
                    return 'please enter a valid number';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (value) {
                  if (cubit.formKey.currentState!.validate()) {}
                },
                controller: cubit.phoneController,
                decoration: const InputDecoration(
                  //TODO: add the user phone form api here
                  hintText: '01xxxxxxxxx',
                ),
              ),
              HeaderText(
                text: "user_details.address".tr(),
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: cubit.addressController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'address must not be empty';
                  } else {
                    return null;
                  }
                },
                onFieldSubmitted: (value) {
                  if (cubit.formKey.currentState!.validate()) {}
                },
                decoration: InputDecoration(
                    //TODO: add the user address form api here
                    hintText: '15, nour St',
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: AppColors.blackColor,
                          size: 20,
                        ))),
              ),
              HeaderText(
                text: "user_details.password".tr(),
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: cubit.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  //TODO: add the user password form api here
                  hintText: '***********',
                  suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.solidEdit,
                        color: AppColors.blackColor,
                        size: 20,
                      )),
                ),
              ),
              const SizedBox(height: 32.0),
            ],
          ),
        );
      },
    );
  }
}
