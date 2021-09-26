import 'package:flutter/material.dart';
import '../model/orders_model.dart';

class OrdersListCard extends StatelessWidget {
  final List<OrderModel> orderModel;
  final int index;

  const OrdersListCard(
      {Key? key, required this.orderModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.red)),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderModel[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              "Desc: ${orderModel[index].desc}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Text(
              "Date: ${orderModel[index].date}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54),
            ),
            const SizedBox(height: 5),
            Text(
              "Address: ${orderModel[index].address}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "Total: ${orderModel[index].totalPrice}",
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
