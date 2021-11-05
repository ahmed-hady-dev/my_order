// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:my_order/view/orders/controller/orders_cubit.dart';

import '../component/list_separator.dart';
import '../component/orders_list_card.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = OrdersCubit.get(context);
    print(cubit.recentOrders!.toJson());
    if (cubit.recentOrders == null ||
        cubit.recentOrders!.data == null ||
        cubit.recentOrders!.data!.isEmpty) {
      return const SizedBox();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const ListSeparator(),
        itemCount: cubit.recentOrders!.data!.length,
        itemBuilder: (context, index) => OrdersListCard(
          orderModel: cubit.recentOrders!.data!,
          index: index,
        ),
      ),
    );
  }
}
