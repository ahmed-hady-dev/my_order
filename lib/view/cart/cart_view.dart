// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/view/cart/states.dart';
import 'package:my_order/view/cart/widgets/food_cart_card.dart';
import 'package:my_order/widgets/loading_indicator.dart';

import 'component/buttons_row.dart';
import 'component/order_details_card.dart';
import 'cubit.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getDetails(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("cart.appBar_title".tr()),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.delete_forever)),
            ],
          ),
          body: Center(
            child: BlocBuilder<CartCubit, CartStates>(
              builder: (context, state) {
                if (state is CartLoading) return const LoadingIndicator();
                final data = CartCubit.of(context).cartModel!.data!;
                return ListView(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.items!.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = data.items![index];
                        return FoodCartCard(
                          item: item,
                          storeId: data.store!.id!,
                          orderCount: item.pivot!.quantity!,
                          name: item.name!,
                          price: item.pivot!.itemSizeId!.price!.toDouble(),
                          image: item.image!,
                          description: item.description!,
                          onTap: () {
                            debugPrint("remove");
                          },
                        );
                      },
                    ),
                    OrderDetailsCard(
                      totalPrice: data.total!.toDouble(),
                      deliveryFee: data.deliveryFees!.toDouble(),
                    ),
                    const ButtonsRow(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
