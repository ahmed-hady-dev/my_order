// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/view/cart/widgets/food_cart_card.dart';
import 'package:my_order/view/order/controller/order_cubit.dart';
import 'package:my_order/view/store/model/food_category_model.dart';

import 'component/buttons_row.dart';
import 'component/order_details_card.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OrderCubit, OrderState>(
        builder: (context, state) {
          final cubit = OrderCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text("cart.appBar_title".tr())),
            body: Center(
              child: ListView(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: foodCategoryList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => FoodCartCard(
                        orderCount: cubit.orderCount,
                        name: foodCategoryList[index].name,
                        price: foodCategoryList[index].price,
                        image: foodCategoryList[index].image,
                        description: foodCategoryList[index].description,
                        onTap: () {}),
                  ),
                  OrderDetailsCard(totalPrice: cubit.totalPrice),
                  const ButtonsRow(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
