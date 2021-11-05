// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/cart/cart_view.dart';
import 'package:my_order/widgets/loading_indicator.dart';
import '../home/widgets/section_header.dart';
import 'component/order_main_header.dart';
import 'widgets/choices_card.dart';
import '../store/component/food_image.dart';
import 'component/add_to_cart_button.dart';
import 'controller/order_cubit.dart';
import 'model/choices_model.dart';

class OrderView extends StatelessWidget {
  final String name;
  final double price;
  final String image;
  final int storeId;
  final String description;
  final int itemId;

  const OrderView({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
    required this.itemId,
    required this.storeId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(storeId, itemId)..getDetails(),
      child: SafeArea(
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            final cubit = OrderCubit.get(context);
            if(state is OrderLoading)
              return Scaffold(
                body: LoadingIndicator(),
              );
            final data = cubit.itemDetailsModel!.data!;
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(onPressed: (){
                    MagicRouter.navigateTo(CartView());
                  }, icon: Icon(Icons.shopping_basket_outlined)),
                ],
              ),
              body: ListView(
                children: <Widget>[
                  FoodImage(image: image),
                  const SizedBox(height: 24.0),
                  OrderMainHeader(
                    name: name,
                    description: description,
                    orderCount: cubit.orderCount,
                    price: price,
                  ),
                  ChoicesCard(
                    headerText: "order.choose_size".tr(),
                    isSubText: false,
                    list: data.sizes!,
                    isSize: true,
                  ),
                  const SizedBox(height: 12.0),
                  ChoicesCard(
                    headerText: "order.extras".tr(),
                    isSubText: true,
                    subText: "order.Optional",
                    isSize: false,
                    list: data.extras!,
                  ),
                  // const SizedBox(height: 12.0),
                  // SectionHeader(
                  //   headerText: "order.add_notes".tr(),
                  //   buttonText: '',
                  //   showButton: false,
                  //   onPressed: () {},
                  // ),
                  // Container(
                  //   height: 66.0,
                  //   margin: const EdgeInsets.symmetric(
                  //       vertical: 8.0, horizontal: 16.0),
                  //   child: TextField(
                  //     autofocus: false,
                  //     onChanged: (v)=> cubit.notes = v,
                  //     expands: true,
                  //     maxLines: null,
                  //     keyboardType: TextInputType.multiline,
                  //     decoration: InputDecoration(
                  //       border: InputBorder.none,
                  //       isCollapsed: true,
                  //       hintText: "order.write".tr(),
                  //     ),
                  //   ),
                  // ),
                  AddToCartButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
