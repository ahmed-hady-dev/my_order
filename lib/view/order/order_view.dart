// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/cart/cart_view.dart';
import 'package:my_order/view/offers/component/no_offers.dart';
import 'package:my_order/widgets/loading_widget.dart';
import 'component/order_main_header.dart';
import 'widgets/choices_card.dart';
import '../store/component/food_image.dart';
import 'component/add_to_cart_button.dart';
import 'controller/order_cubit.dart';

class OrderView extends StatelessWidget {
  final String name;
  final String image;
  final int storeId;
  final String description;
  final int itemId;

  const OrderView({
    Key? key,
    required this.image,
    required this.name,
    required this.description,
    required this.itemId,
    required this.storeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit()..getDetails(itemId: itemId),
      child: SafeArea(
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            final cubit = OrderCubit.get(context);
            if (cubit.itemDetailsModel == null) {
              return const Scaffold(body: LoadingWidget());
            }
            if (state is GetDetailsError) {
              return const Scaffold(body: NoData(text: 'some error'));
            }
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        MagicRouter.navigateTo(const CartView());
                      },
                      icon: const Icon(Icons.shopping_basket_outlined)),
                ],
              ),
              body: cubit.itemDetailsModel!.data == null
                  ? const NoData(text: 'data is null')
                  : ListView(
                      children: <Widget>[
                        FoodImage(image: image),
                        const SizedBox(height: 24.0),
                        OrderMainHeader(
                          name: name,
                          description: description,
                          orderCount: cubit.orderCount,
                        ),
                        cubit.itemDetailsModel!.data!.sizes!.isEmpty
                            ? const SizedBox()
                            : ChoicesCard(
                                headerText: "order.choose_size".tr(),
                                isSubText: false,
                                list: cubit.itemDetailsModel!.data!.sizes,
                                isSize: true,
                              ),
                        const SizedBox(height: 12.0),
                        cubit.itemDetailsModel!.data!.extras!.isEmpty
                            ? const SizedBox()
                            : ChoicesCard(
                                headerText: "order.extras".tr(),
                                isSubText: true,
                                subText: "order.optional".tr(),
                                isSize: false,
                                list: cubit.itemDetailsModel!.data!.extras!,
                              ),
                        AddToCartButton(storeId: storeId, itemId: itemId),
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
