// ignore_for_file: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/view/cart/component/cart_order_counter_row.dart';
import 'package:my_order/view/cart/cubit.dart';
import 'package:my_order/view/cart/model/cart.dart';
import 'package:my_order/widgets/description_text.dart';
import 'package:my_order/widgets/price_text.dart';
import 'package:my_order/widgets/restaurant_name.dart';

import '../../../constants/app_colors.dart';

class FoodCartCard extends StatelessWidget {
  final String name;
  final double price;
  final int orderCount;
  final Item item;
  final int storeId;
  final String image;
  final String description;
  final VoidCallback onTap;

  const FoodCartCard(
      {Key? key,
      required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.onTap,
      required this.orderCount, required this.item, required this.storeId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 84.0,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.redColor, width: 1.0),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: InkWell(
              onTap: onTap,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 84.0,
                    // width: ,
                    width: 120.0,
                    margin: context.locale.languageCode == 'en'
                        ? const EdgeInsets.only(right: 6.0)
                        : const EdgeInsets.only(left: 6.0),
                    decoration: BoxDecoration(
                      borderRadius: context.locale.languageCode == 'en'
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RestaurantName(
                              name: name,
                              verticalPadding: 4.0,
                            ),
                            DescriptionText(
                              description: description,
                              verticalPadding: 0.0,
                            ),
                            const Spacer(),
                            CartOrderCounterRow(storeId: storeId,item: item,orderCount: orderCount),
                            const SizedBox(height: 8.0)
                          ],
                        ),
                        Expanded(
                          child: PriceText(
                              price: 'Price : EGP $price', fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: context.locale.languageCode == 'en' ? Alignment.centerRight : Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: () {
                CartCubit.of(context).removeCart(storeId: storeId, quantity: item.pivot!.quantity!, itemId: item.id!, sizeId: item.pivot!.itemSizeId!.id!, extraId: item.pivot!.extras != null && item.pivot!.extras!.isNotEmpty ? item.pivot!.extras![0].id! : null);
              },
            ),
          ),
        ],
      ),
    );
  }
}
