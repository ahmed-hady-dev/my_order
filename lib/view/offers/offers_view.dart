// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/offers/widgets/offres_card.dart';
import 'package:my_order/view/vouchers/vouchers_view.dart';

import 'model/offers_model.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("offers.appBar_title".tr())),
        body: ListView.builder(
          itemCount: offersList.length,
          itemBuilder: (context, index) => OffersCard(
              onTap: () => MagicRouter.navigateTo(const VouchersView()),
              name: offersList[index].name,
              price: offersList[index].price,
              image: offersList[index].image,
              discountPercentage: offersList[index].discountPercentage,
              validDate: offersList[index].validDate),
        ),
      ),
    );
  }
}
