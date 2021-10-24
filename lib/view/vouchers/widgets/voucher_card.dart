// ignore_for_file: implementation_imports

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/custom_vertical_divider.dart';

class VoucherCard extends StatelessWidget {
  const VoucherCard(
      {Key? key,
      required this.percentage,
      required this.discountCode,
      required this.startAt,
      required this.endAt})
      : super(key: key);
  final int percentage;
  final String discountCode;
  final String startAt;
  final String endAt;
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
                  child: AutoSizeText(
                      '${percentage.toInt()}% ' + "vouchers.discount".tr(),
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
                AutoSizeText(
                  "vouchers.get_your_voucher".tr(),
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                AutoSizeText(
                  "vouchers.use_the_code".tr() + ' ' + discountCode,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.clock,
                          size: 12.0,
                          color: Colors.green,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          "vouchers.start_at".tr() + ' ' + startAt,
                          style: const TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.clock,
                          size: 12.0,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 4.0),
                        Text(
                          "vouchers.end_at".tr() + ' ' + endAt,
                          style: const TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
