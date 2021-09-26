// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/cart/cart_view.dart';
import 'package:my_order/view/order/controller/order_cubit.dart';
import 'package:my_order/widgets/main_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: MainButton(
        text: "order.cart_button_title".tr(),
        onPressed: () => MagicRouter.navigateTo(
          BlocProvider.value(
            value: OrderCubit.get(context),
            child: const CartView(),
          ),
        ),
      ),
    );
  }
}
