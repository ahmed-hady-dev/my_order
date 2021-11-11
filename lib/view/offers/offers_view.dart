// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/offers/component/no_offers.dart';
import 'package:my_order/view/offers/widgets/offers_card.dart';
import 'package:my_order/view/order/order_view.dart';
import 'package:my_order/view/store/controller/store_cubit.dart';
import 'package:my_order/view/store/model/store_offer_model.dart';
import 'package:my_order/widgets/loading_dialog.dart';

class OffersView extends StatelessWidget {
  const OffersView({Key? key, required this.storeOfferModel, this.storeId})
      : super(key: key);
  final StoreOfferModel storeOfferModel;
  final int? storeId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<StoreCubit, StoreState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text("offers.appBar_title".tr())),
            body: storeOfferModel.data!.isEmpty
                ? NoData(text: "offers.no_offers".tr())
                : ListView.builder(
                    itemCount: storeOfferModel.data!.length,
                    itemBuilder: (context, index) => OffersCard(
                      storeOfferModelData: storeOfferModel.data![index]!,
                      onTap: () {
                        loadingDialog(context);
                        debugPrint(storeOfferModel.data![index]!.id.toString());
                        debugPrint(
                            storeOfferModel.data![index]!.name.toString());
                        StoreCubit().getItems(storeId: storeId!).then((value) {
                          MagicRouter.pop();
                          MagicRouter.navigateTo(
                            OrderView(
                              storeId: storeId!,
                              itemId: storeOfferModel.data![index]!.id!,
                              image: storeOfferModel.data![index]!.image!,
                              name: storeOfferModel.data![index]!.name!,
                              description:
                                  storeOfferModel.data![index]!.description!,
                            ),
                          );
                        });
                      },
                    ),
                  ),
          );
        },
      ),
    );
  }
}
