// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/widgets/main_button.dart';

import 'component/checkout_form.dart';
import 'controller/checkout_cubit.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => CheckoutCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("checkout.appBar_title".tr()),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  const CheckoutForm(),
                  const SizedBox(height: 32.0),
                  MainButton(
                    text: "checkout.button_title".tr(),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
