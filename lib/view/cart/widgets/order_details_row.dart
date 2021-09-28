import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class OrderDetailsRow extends StatelessWidget {
  final String title;
  final double price;
  const OrderDetailsRow({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(width: 8.0),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 22.0, vertical: 6.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.redColor, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text('${price.toString()} EGP'),
          )
        ],
      ),
    );
  }
}
