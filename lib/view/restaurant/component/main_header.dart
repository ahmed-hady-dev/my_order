// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/restaurant_info/restaurant_info_view.dart';
import 'package:my_order/view/reviews/reviews_view.dart';
import 'package:my_order/widgets/clickable_small_text.dart';
import 'package:my_order/widgets/custom_vertical_divider.dart';
import 'package:my_order/widgets/small_grey_text.dart';
import 'package:my_order/widgets/stars_bar.dart';
import 'package:my_order/widgets/status_row.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({
    Key? key,
    required this.name,
    required this.status,
    required this.stars,
    required this.price,
    required this.time,
    required this.distance,
  }) : super(key: key);

  final String name;
  final String status;
  final double stars;
  final double price;
  final String time;
  final String distance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  const SizedBox(width: 4.0),
                  StatusRow(statusText: status, textColor: AppColors.redColor),
                ],
              ),
              StarsBar(stars: stars),
            ],
          ),
          const SizedBox(height: 8.0),
          Row(
            children: <Widget>[
              SmallGreyText(text: 'Delivery:${price.toString()} EGP'),
              const CustomVerticalDivider(),
              SmallGreyText(text: time),
              const CustomVerticalDivider(),
              SmallGreyText(text: distance),
              const Spacer(),
              ClickableSmallText(
                  text: "restaurant.info".tr(),
                  onTap: () =>
                      MagicRouter.navigateTo(const RestaurantInfoView())),
              const CustomVerticalDivider(),
              ClickableSmallText(
                  text: "restaurant.reviews".tr(),
                  onTap: () => MagicRouter.navigateTo(const ReviewsView())),
            ],
          )
        ],
      ),
    );
  }
}
