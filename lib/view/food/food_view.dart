import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/home/component/home_appbar_title.dart';
import 'package:my_order/view/search/search_view.dart';
import 'widgets/food_section_header.dart';
import '../home/component/food_item_card.dart';
import '../home/controller/home_cubit.dart';
import '../home/model/food_card_model.dart';

import 'component/all_restaurants.dart';
import 'component/category_food_list_view.dart';

class FoodView extends StatelessWidget {
  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final foodSectionCubit = HomeCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: HomeAppBarTitle(
                    onPressed: () =>
                        MagicRouter.navigateTo(const SearchView())),
              ),
              body: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  CategoryFoodListView(cubit: foodSectionCubit),
                  const FoodSectionHeader(text: "Fast delivery", fontSize: 25),
                  FoodItemCard(foodCardModel: foodCardModel),
                  const FoodSectionHeader(
                      text: "All restaurants", fontSize: 20),
                  const AllRestaurants(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
