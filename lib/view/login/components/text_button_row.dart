// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/forget_password/forget_password_view.dart';
import 'package:my_order/view/register/register_view.dart';

class TextButtonRow extends StatelessWidget {
  const TextButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () => MagicRouter.navigateTo(const ForgetPasswordView()),
          child: Text("login.forgot_password".tr(),
              style: const TextStyle(
                  color: Colors.black, decoration: TextDecoration.underline)),
        ),
        TextButton(
          onPressed: () => MagicRouter.navigateTo(const RegisterView()),
          child: Text("login.create_account".tr(),
              style: const TextStyle(fontSize: 16.0)),
        ),
      ],
    );
  }
}
