// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/checkout/checkout_view.dart';
import 'package:my_order/view/home/home_view.dart';
import 'package:my_order/widgets/main_button.dart';

class ButtonsRow extends StatelessWidget {
  const ButtonsRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Flexible(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: MainButton(
              text: "cart.checkout_button_title".tr(),
              onPressed: () => MagicRouter.navigateTo(const CheckoutView()),
            ),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: MainButton(
              text: "cart.add_item_button_title".tr(),
              onPressed: () => MagicRouter.navigateAndPopAll(const HomeView()),
            ),
          ),
        ),
      ],
    );
  }
}
