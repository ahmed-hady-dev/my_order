import 'package:flutter/material.dart';
import '../model/voucher_model.dart';
import '../widgets/voucher_card.dart';

class ExpiredTabView extends StatelessWidget {
  const ExpiredTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.separated(
        itemCount: voucherList.length,
        separatorBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(),
        ),
        itemBuilder: (context, index) => VoucherCard(
          discountCode: voucherList[index].discountCode,
          discountText: voucherList[index].discountText,
          percentage: voucherList[index].percentage,
        ),
      ),
    );
  }
}
