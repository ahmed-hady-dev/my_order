// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/constants/app_colors.dart';

import '../model/orders_model.dart';

class OrdersListCard extends StatelessWidget {
  final List<Datum> orderModel;
  final int index;

  const OrdersListCard(
      {Key? key, required this.orderModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.redColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orderModel[index].store!.name!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4.0),
          Text(
            "orders.payment".tr() + orderModel[index].payment.toString(),
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          // const SizedBox(height: 4.0),
          Text(
            "orders.state".tr() + orderModel[index].state.toString(),
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 12.0),
          Center(
            child: Text(
              "orders.total".tr() +
                  orderModel[index].total!.toString() +
                  ' ' +
                  "restaurant.egp".tr(),
              style: const TextStyle(fontSize: 18, color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
