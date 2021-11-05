// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  final String description;

  const OrderView({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => OrderCubit(),
        child: BlocBuilder<OrderCubit, OrderState>(
          builder: (context, state) {
            final cubit = OrderCubit.get(context);
            return Scaffold(
              appBar: AppBar(),
              body: ListView(
                children: <Widget>[
                  FoodImage(image: image),
                  const SizedBox(height: 24.0),
                  OrderMainHeader(
                      name: name,
                      description: description,
                      orderCount: cubit.orderCount,
                      price: price),
                  ChoicesCard(
                      headerText: "order.choose_size".tr(),
                      isSubText: false,
                      list: sizeChoicesModel),
                  const SizedBox(height: 12.0),
                  ChoicesCard(
                      headerText: "order.extras".tr(),
                      isSubText: true,
                      subText: "order.Optional",
                      list: extrasChoicesModel),
                  const SizedBox(height: 12.0),
                  SectionHeader(
                      headerText: "order.add_notes".tr(),
                      buttonText: '',
                      showButton: false,
                      onPressed: () {}),
                  Container(
                    height: 66.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: TextField(
                      autofocus: false,
                      expands: true,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                        hintText: "order.write".tr(),
                      ),
                    ),
                  ),
                  const AddToCartButton(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
