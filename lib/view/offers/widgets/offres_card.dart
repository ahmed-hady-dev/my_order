// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/view/offers/component/more_details_button.dart';
import 'package:my_order/view/offers/widgets/valid_date_row.dart';
import 'package:my_order/widgets/price_text.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/restaurant_name.dart';

class OffersCard extends StatelessWidget {
  final String name;
  final double price;
  final double discountPercentage;
  final String validDate;
  final String image;
  final VoidCallback onTap;

  const OffersCard({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
    required this.onTap,
    required this.discountPercentage,
    required this.validDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 84.0,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.redColor, width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 84.0,
                  width: 120.0,
                  decoration: BoxDecoration(
                      borderRadius: context.locale.languageCode == 'en'
                          ? const BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0))
                          : const BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                      image: DecorationImage(
                          image: AssetImage(image), fit: BoxFit.cover)),
                ),
                Positioned(
                  right: 0.0,
                  child: Container(
                    color: AppColors.redColor,
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 8.0),
                    child: Text('-${discountPercentage.toInt()}%',
                        style: const TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RestaurantName(name: name),
                      PriceText(
                          price: 'Price : EGP ${price.toInt()}',
                          fontSize: 12.0),
                      ValidDateRow(validDate: validDate)
                      // DescriptionText(description: description),
                    ],
                  ),
                  MoreDetailsButton(
                      onTap: onTap, text: "offers.more_details".tr()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
