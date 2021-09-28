import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/custom_vertical_divider.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard(
      {Key? key,
      required this.percentage,
      required this.discountText,
      required this.discountCode})
      : super(key: key);
  final double percentage;
  final String discountText;
  final String discountCode;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppColors.redColor),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.local_offer_rounded,
                      color: AppColors.redColor, size: 36.0),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: AutoSizeText('${percentage.toInt()}% $discountText',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColors.redColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0)),
                ),
              ],
            ),
          ),
          const CustomVerticalDivider(color: AppColors.redColor, height: 100.0),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const AutoSizeText(
                  'Get your voucher',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                AutoSizeText(
                  'Write the code $discountCode',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
