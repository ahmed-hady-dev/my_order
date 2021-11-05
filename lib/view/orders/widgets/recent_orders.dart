import 'package:flutter/material.dart';
import 'package:my_order/view/orders/controller/orders_cubit.dart';

import '../component/list_separator.dart';
import '../component/orders_list_card.dart';
import '../model/orders_model.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = OrdersCubit.get(context);
    print(cubit.recentOrders!.toJson());
    if(cubit.recentOrders == null || cubit.recentOrders!.data == null || cubit.recentOrders!.data!.isEmpty)
      return SizedBox();
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
