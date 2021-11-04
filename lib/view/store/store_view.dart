import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component/food_category_listview.dart';
import 'component/food_category_tab_bar.dart';
import 'component/food_image.dart';
import 'component/main_header.dart';
import 'component/offer_button.dart';
import 'controller/restaurant_cubit.dart';
import 'model/label_text_list.dart';

class StoreView extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final double rate;
  final double deliveryFees;
  final String openAt;
  final String closeAt;
  const StoreView(
      {Key? key,
      required this.name,
      required this.image,
      required this.rate,
      required this.description,
      required this.openAt,
      required this.closeAt,
      required this.deliveryFees})
      : super(key: key);

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: labelTextList.length, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => RestaurantCubit(),
        child: BlocBuilder<RestaurantCubit, RestaurantState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodImage(image: widget.image),
                  const SizedBox(height: 24.0),
                  MainHeader(
                      name: widget.name,
                      rate: widget.rate,
                      description: widget.description,
                      openAt: widget.openAt,
                      closeAt: widget.closeAt,
                      deliveryFees: widget.deliveryFees),
                  const SizedBox(height: 20.0),
                  const OfferButton(),
                  FoodCategoryTabBar(
                      controller: controller, list: labelTextList),
                  Flexible(
                    child: TabBarView(controller: controller, children: const [
                      FoodCategoryListView(),
                      FoodCategoryListView(),
                      FoodCategoryListView(),
                      FoodCategoryListView(),
                    ]),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
