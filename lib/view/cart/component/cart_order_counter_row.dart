import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../order/controller/order_cubit.dart';
import '../../order/widgets/change_order_button.dart';

class CartOrderCounterRow extends StatelessWidget {
  const CartOrderCounterRow({
    Key? key,
    required this.orderCount,
  }) : super(key: key);

  final int orderCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ChangeOrderButton(
            iconSize: 20.0,
            constraints: const BoxConstraints(),
            onPressed: () {
              if (orderCount >= 2) {
                OrderCubit.get(context).decreaseOrderCount();
              } else {
                Fluttertoast.showToast(msg: 'orders must be 1 at least');
              }
            },
            icon: FontAwesomeIcons.minusCircle),
        SizedBox(
          width: 24.0,
          child: Text(
            orderCount.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
        ChangeOrderButton(
            iconSize: 20.0,
            constraints: const BoxConstraints(),
            onPressed: () {
              if (orderCount <= 19) {
                OrderCubit.get(context).increaseOrderCount();
              } else {
                Fluttertoast.showToast(msg: 'orders must be 20 at maximum');
              }
            },
            icon: FontAwesomeIcons.plusCircle),
      ],
    );
  }
}
