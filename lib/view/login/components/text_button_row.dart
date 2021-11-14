// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/register/register_view.dart';
import 'package:my_order/widgets/description_text.dart';

class TextButtonRow extends StatelessWidget {
  const TextButtonRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        DescriptionText(
          description: "login.no_account".tr(),
          horizontalPadding: 0.0,
          verticalPadding: 0.0,
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
