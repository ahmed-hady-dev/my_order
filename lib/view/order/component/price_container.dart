import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../controller/order_cubit.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({
    Key? key,
    required this.totalPrice,
  }) : super(key: key);

  final double totalPrice;
  @override
  Widget build(BuildContext context) {
    OrderCubit.get(context).totalPrice = totalPrice;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.redColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text('$totalPrice EGP',
          style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black)),
    );
  }
}
