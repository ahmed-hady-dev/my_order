// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/constants/app_colors.dart';

class TotalText extends StatelessWidget {
  final double totalPrice;

  const TotalText({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 6.0),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.redColor, width: 1.0),
            borderRadius: BorderRadius.circular(8.0)),
        child: Text('${"cart.total".tr()} : ${totalPrice.toString()}',
            style:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
