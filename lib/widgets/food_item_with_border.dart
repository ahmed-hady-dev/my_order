// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/widgets/restaurant_info_column.dart';

import 'stars_and_time_column.dart';

class FoodItemWithBorder extends StatelessWidget {
  final String status;
  final double price;
  final String name;
  final String time;
  final String image;
  final double stars;
  final VoidCallback onTap;
  const FoodItemWithBorder({
    Key? key,
    required this.status,
    required this.price,
    required this.name,
    required this.time,
    required this.stars,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: () => onTap(),
        borderRadius: BorderRadius.circular(20.0),
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
              Container(
                height: 84.0,
                width: 120.0,
                margin: context.locale == const Locale('en', 'US')
                    ? const EdgeInsets.only(right: 6.0)
                    : const EdgeInsets.only(left: 6.0),
                decoration: BoxDecoration(
                  borderRadius: context.locale == const Locale('en', 'US')
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0))
                      : const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RestaurantInfoColumn(
                      name: name,
                      price: price,
                      statusText: status,
                    ),
                    // const Spacer(),
                    StarsAndTimeColumn(
                      timeText: time,
                      stars: stars,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
