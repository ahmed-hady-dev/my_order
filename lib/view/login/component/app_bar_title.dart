// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/constants/app_colors.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Align(
        child: Text(
          "welcome.login".tr(),
          style: const TextStyle(
              color: AppColors.blackColor,
              fontSize: 25.0,
              fontWeight: FontWeight.bold),
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
