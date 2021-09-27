// ignore_for_file: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'component/payment_row.dart';
import 'component/rating_row.dart';
import 'component/res_info_list_tile.dart';

class RestaurantInfoView extends StatelessWidget {
  const RestaurantInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("restaurant_info.appBar_title".tr())),
        body: ListView(
          children: [
            const RatingRow(
              ratingText: "2100 ratings",
              stars: 5,
            ),
            const Divider(),
            ResInfoListTile(
              icon: Icons.location_pin,
              iconText: "restaurant_info.restaurant_area".tr(),
              trailingText: "Masaken El shennawy",
            ),
            const Divider(),
            ResInfoListTile(
              icon: FontAwesomeIcons.clock,
              iconText: "restaurant_info.opining_hours".tr(),
              trailingText: "9:00Am - 2:30AM",
            ),
            const Divider(),
            ResInfoListTile(
              icon: FontAwesomeIcons.wallet,
              iconText: "restaurant_info.minimum_order".tr(),
              trailingText: "EGP 15.00",
            ),
            const Divider(),
            ResInfoListTile(
              icon: Icons.featured_play_list,
              iconText: "restaurant_info.delivery_fee".tr(),
              trailingText: "EGP 4.99",
            ),
            const Divider(),
            ResInfoListTile(
              icon: Icons.info,
              iconText: "restaurant_info.preorder".tr(),
              trailingText: "No",
            ),
            const Divider(),
            PaymentRow(
              text: "restaurant_info.payment_options".tr(),
            ),
          ],
        ),
      ),
    );
  }
}
