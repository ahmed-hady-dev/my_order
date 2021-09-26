// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/view/checkout/controller/checkout_cubit.dart';
import 'package:my_order/widgets/header_text.dart';

class CheckoutForm extends StatelessWidget {
  const CheckoutForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      builder: (context, state) {
        final cubit = CheckoutCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 18.0),
              HeaderText(text: "checkout.full_name".tr()),
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
                  //TODO: add the user name form api in here
                  hintText: 'Ahmed Abd-ElHady',
                ),
              ),
              HeaderText(text: "checkout.phone_number".tr()),
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
                // controller: cubit.phoneController,
                decoration: const InputDecoration(
                  //TODO: add the user phone form api here
                  hintText: '01xxxxxxxxx',
                ),
              ),
              HeaderText(text: "checkout.address".tr()),
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
                    onPressed: () {
                      //TODO: add navigation here
                    },
                    icon: const FaIcon(
                      FontAwesomeIcons.mapMarkerAlt,
                      color: AppColors.blackColor,
                      size: 20,
                    ),
                  ),
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
