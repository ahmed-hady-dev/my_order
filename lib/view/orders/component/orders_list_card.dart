import 'package:flutter/material.dart';

import '../model/orders_model.dart';

class OrdersListCard extends StatelessWidget {
  final List<Datum> orderModel;
  final int index;

  OrdersListCard(
      {Key? key, required this.orderModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            orderModel[index].store!.name!,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 4.0),
          // Text(
          //   orderModel[index].descount,
          //   style: const TextStyle(fontSize: 14, color: Colors.black54),
          // ),
          // const SizedBox(height: 4.0),
          Text(
            "Payment: ${orderModel[index].payment}",
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          // const SizedBox(height: 4.0),
          Text(
            "State: ${orderModel[index].state}",
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Total: ${orderModel[index].total!}",
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
