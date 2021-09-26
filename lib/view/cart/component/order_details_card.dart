// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/view/cart/component/total_text.dart';
import 'package:my_order/view/cart/widgets/order_details_row.dart';

import 'order_details_header.dart';

class OrderDetailsCard extends StatelessWidget {
  const OrderDetailsCard({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);
  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        border:
            Border.all(color: AppColors.redColor.withOpacity(0.5), width: 1.0),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderDetailsHeader(),
          const SizedBox(height: 0.0),
          OrderDetailsRow(
            title: "cart.special_services".tr(),
            price: 10,
          ),
          OrderDetailsRow(
            title: "cart.delivery_price".tr(),
            price: 10,
          ),
          TotalText(totalPrice: totalPrice),
        ],
      ),
    );
  }
}
