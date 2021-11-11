// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/view/home/controller/home_cubit.dart';
import 'package:my_order/view/home/model/special_offers_model.dart';
import 'package:my_order/view/order/order_view.dart';
import 'package:my_order/widgets/loading_dialog.dart';
import 'package:my_order/widgets/stars_bar.dart';
import '../../../core/router/router.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key? key,
    required this.specialOffersModel,
  }) : super(key: key);
  final SpecialOffersModel specialOffersModel;
  @override
  Widget build(BuildContext context) {
    final item = specialOffersModel.data!;
    return SizedBox(
      height: 194.0,
      child: ListView.builder(
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: item.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              loadingDialog(context);
              HomeCubit.get(context)
                  .getItemById(itemId: item[index]!.id.toString())
                  .then(
                (itemModel) {
                  MagicRouter.pop();
                  MagicRouter.navigateTo(
                    OrderView(
                      image: item[index]!.image!.toString(),
                      name: item[index]!.name!.toString(),
                      description: item[index]!.description!.toString(),
                      itemId: item[index]!.id!,
                      storeId: item[index]!.store!.id!,
                    ),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //image container
                  Container(
                    width: 202,
                    height: 132.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey.shade300,
                      image: DecorationImage(
                        image: NetworkImage(item[index]!.image!.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //name container
                  SizedBox(
                    width: 200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        item[index]!.name!.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 14.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "home.delivery".tr() +
                                ' ' +
                                item[index]!.store!.deliveryFees!.toString() +
                                ' ' +
                                "restaurant.egp".tr(),
                            style: const TextStyle(
                                fontSize: 8.0, fontWeight: FontWeight.normal),
                          ),
                          StarsBar(
                              stars: double.parse(item[index]!.store!.rate!)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
