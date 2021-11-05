import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/widgets/loading_indicator.dart';

import 'component/food_category_listview.dart';
import 'component/food_category_tab_bar.dart';
import 'component/food_image.dart';
import 'component/main_header.dart';
import 'component/offer_button.dart';
import 'controller/restaurant_cubit.dart';

class StoreView extends StatefulWidget {
  final String image;
  final String name;
  final int storeId;
  final String description;
  final double rate;
  final double deliveryFees;
  final String openAt;
  final String closeAt;
  final int reviewsNumber;
  const StoreView(
      {Key? key,
      required this.name,
      required this.image,
      required this.rate,
      required this.description,
      required this.openAt,
      required this.closeAt,
      required this.deliveryFees,
      required this.storeId,
      required this.reviewsNumber})
      : super(key: key);

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  final cubit = RestaurantCubit();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => cubit
          ..getItems(widget.storeId)
          ..getReviewByStoreId(storeId: widget.storeId),
        child: BlocBuilder<RestaurantCubit, RestaurantState>(
          builder: (context, state) {
            if (cubit.storeItemsModel == null)
              return Scaffold(
                body: LoadingIndicator(),
              );
            final data = cubit.storeItemsModel!.data!;
            return DefaultTabController(
              length: data.length,
              child: Scaffold(
                appBar: AppBar(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodImage(image: widget.image),
                    const SizedBox(height: 24.0),
                    MainHeader(
                        cubit: cubit,
                        reviewsNumber: widget.reviewsNumber,
                        storeId: widget.storeId,
                        name: widget.name,
                        rate: widget.rate,
                        description: widget.description,
                        openAt: widget.openAt,
                        closeAt: widget.closeAt,
                        deliveryFees: widget.deliveryFees),
                    const SizedBox(height: 20.0),
                    const OfferButton(),
                    FoodCategoryTabBar(list: data),
                    Flexible(
                      child: TabBarView(
                        children: data
                            .map((e) => FoodCategoryListView(items: e.items!))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
