import 'package:flutter/material.dart';

import '../component/list_separator.dart';
import '../component/orders_list_card.dart';
import '../model/orders_model.dart';

class RecentOrders extends StatelessWidget {
  const RecentOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
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
