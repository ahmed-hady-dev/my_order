// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/view/store/model/store_offer_model.dart';
import 'package:my_order/widgets/price_text.dart';

import '../../../constants/app_colors.dart';
import '../../../widgets/restaurant_name.dart';

class OffersCard extends StatelessWidget {
  final VoidCallback onTap;
  final StoreOfferModelData storeOfferModelData;

  const OffersCard({
    Key? key,
    required this.onTap,
    required this.storeOfferModelData,
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
        child: InkWell(
          onTap: onTap,
          child: Row(
            children: <Widget>[
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
                        image: NetworkImage(storeOfferModelData.image!),
                        fit: BoxFit.cover)),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RestaurantName(name: storeOfferModelData.name!),
                          PriceText(
                            price: "restaurant.price".tr() +
                                "${storeOfferModelData.price!.toInt()} " +
                                "restaurant.egp".tr(),
                            fontSize: 12.0,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
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
                                "vouchers.start_at".tr() +
                                    ' ' +
                                    storeOfferModelData.startAt!,
                                style: const TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.normal),
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
                                "vouchers.end_at".tr() +
                                    ' ' +
                                    storeOfferModelData.endAt!,
                                style: const TextStyle(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
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
