// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_order/view/orders/component/list_separator.dart';
import 'package:my_order/view/orders/component/orders_list_card.dart';
import 'package:my_order/view/orders/controller/orders_cubit.dart';

class OldOrders extends StatelessWidget {
  const OldOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = OrdersCubit.get(context);
    if (cubit.oldOrders == null ||
        cubit.oldOrders!.data == null ||
        cubit.oldOrders!.data!.isEmpty) {
      return SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => ListSeparator(),
        itemCount: cubit.oldOrders!.data!.length,
        itemBuilder: (context, index) => OrdersListCard(
          orderModel: cubit.oldOrders!.data!,
          index: index,
        ),
      ),
    );
  }
}
