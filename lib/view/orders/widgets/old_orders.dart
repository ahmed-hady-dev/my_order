// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_order/view/offers/component/no_offers.dart';
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
      return NoData(text: "orders.no_orders".tr());
    }
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20.0),
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(height: 32),
      itemCount: cubit.oldOrders!.data!.length,
      itemBuilder: (context, index) => OrdersListCard(
        orderModel: cubit.oldOrders!.data!,
        index: index,
      ),
    );
  }
}
