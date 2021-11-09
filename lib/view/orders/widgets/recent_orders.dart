// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/view/offers/component/no_offers.dart';
import 'package:my_order/view/orders/controller/orders_cubit.dart';

import '../component/orders_list_card.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = OrdersCubit.get(context);
    debugPrint(cubit.recentOrders!.toJson().toString());
    if (cubit.recentOrders == null ||
        cubit.recentOrders!.data == null ||
        cubit.recentOrders!.data!.isEmpty) {
      return NoData(text: "orders.no_orders".tr());
    }
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20.0),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      separatorBuilder: (context, index) => const Divider(height: 32),
      itemCount: cubit.recentOrders!.data!.length,
      itemBuilder: (context, index) => OrdersListCard(
        orderModel: cubit.recentOrders!.data!,
        index: index,
      ),
    );
  }
}
