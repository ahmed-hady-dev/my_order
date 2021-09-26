import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component/food_category_listview.dart';
import 'component/food_category_tab_bar.dart';
import 'component/food_image.dart';
import 'component/main_header.dart';
import 'component/offer_button.dart';
import 'controller/restaurant_cubit.dart';
import 'model/label_text_list.dart';

class RestaurantView extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final String time;
  final String status;
  final double stars;
  final String distance;
  const RestaurantView(
      {Key? key,
      required this.name,
      required this.image,
      required this.price,
      required this.time,
      required this.stars,
      required this.distance,
      required this.status})
      : super(key: key);

  @override
  State<RestaurantView> createState() => _RestaurantViewState();
}

class _RestaurantViewState extends State<RestaurantView>
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
                    status: widget.status,
                    stars: widget.stars,
                    price: widget.price,
                    time: widget.time,
                    distance: widget.distance,
                  ),
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
