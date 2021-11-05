import 'package:flutter/material.dart';
import '../../../widgets/description_text.dart';

import 'order_counter_row.dart';

class OrderMainHeader extends StatelessWidget {
  const OrderMainHeader({
    Key? key,
    required this.name,
    required this.description,
    required this.orderCount,
  }) : super(key: key);
  final String name;
  final String description;
  final int orderCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              DescriptionText(
                  description: description,
                  horizontalPadding: 0.0,
                  verticalPadding: 14.0,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              OrderCounterRow(orderCount: orderCount),
              // PriceContainer(totalPrice: totalPrice),
            ],
          ),
        ],
      ),
    );
  }
}
