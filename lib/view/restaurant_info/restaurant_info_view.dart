// ignore_for_file: implementation_imports
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/view/food/model/store_model.dart';
import 'component/rating_row.dart';
import 'component/res_info_list_tile.dart';

class RestaurantInfoView extends StatelessWidget {
  const RestaurantInfoView({Key? key, required this.storeModelData})
      : super(key: key);
  final StoreModelData storeModelData;

  @override
  Widget build(BuildContext context) {
    String open = "2020-07-20T${storeModelData.openAt}";
    String close = "2020-07-20T${storeModelData.closeAt}";
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("restaurant_info.appBar_title".tr())),
        body: ListView(
          children: [
            RatingRow(
              ratingText: storeModelData.reviewsNumber.toString() +
                  ' ' +
                  "restaurant_info.rate".tr(),
              stars: double.parse(storeModelData.rate!),
            ),
            ResInfoListTile(
              icon: Icons.location_pin,
              iconText: "restaurant_info.restaurant_area".tr(),
              trailingText: storeModelData.area!.name!,
            ),
            ResInfoListTile(
              icon: FontAwesomeIcons.clock,
              iconText: "restaurant_info.opining_hours".tr(),
              trailingText: DateFormat.jm().format(DateTime.parse(open)) +
                  ' - ' +
                  DateFormat.jm().format(DateTime.parse(close)),
            ),
            ResInfoListTile(
              icon: FontAwesomeIcons.wallet,
              iconText: "restaurant_info.minimum_order".tr(),
              trailingText: storeModelData.minOrder.toString() +
                  ' ' +
                  "restaurant.egp".tr(),
            ),
            ResInfoListTile(
              icon: Icons.featured_play_list,
              iconText: "restaurant_info.delivery_fee".tr(),
              trailingText: storeModelData.deliveryFees.toString() +
                  ' ' +
                  "restaurant.egp".tr(),
            ),
            ResInfoListTile(
              icon: Icons.paid_rounded,
              iconText: "restaurant_info.taxes".tr(),
              trailingText:
                  storeModelData.taxes.toString() + ' ' + "restaurant.egp".tr(),
            ),
          ],
        ),
      ),
    );
  }
}
