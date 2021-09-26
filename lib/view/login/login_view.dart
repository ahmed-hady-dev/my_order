// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/view/login/widgets/app_button.dart';


import 'component/app_bar_title.dart';
import 'component/leading_icon.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: const AppBarTitle(),
          leading: const LeadingIcon(),
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 60),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: Text(
                    "welcome.create_an_account".tr(),
                    style: const TextStyle(
                      fontSize: 21,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 36),
                AppButton(
                  color: AppColors.blackColor,
                  onPress: () {},
                  text: "welcome.continue_with_Email".tr(),
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
