import 'package:flutter/material.dart';
import '../component/list_separator.dart';
import '../component/old_orders_list_card.dart';
import '../model/orders_model.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const ListSeparator(),
        itemCount: recentModelList.length,
        itemBuilder: (context, index) => OrdersListCard(
          orderModel: recentModelList,
          index: index,
        ),
      ),
    );
  }
}
