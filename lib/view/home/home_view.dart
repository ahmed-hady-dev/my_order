// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/drawer/drawer.dart';
import 'package:my_order/view/home/controller/home_cubit.dart';
import 'package:my_order/view/home/model/food_card_model.dart';
import 'package:my_order/view/home/widgets/section_header.dart';
import 'package:my_order/view/search/search_view.dart';
import 'package:my_order/widgets/drawer_icon.dart';
import 'component/home_appbar_title.dart';
import 'component/category_buttons_listview.dart';
import 'component/food_item_card.dart';
import 'component/home_carousel.dart';
import 'component/restaurant_item_card.dart';
import 'model/restaurant_item_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            return Scaffold(
              key: cubit.scaffoldKey,
              drawer: const NavigationDrawer(),
              appBar: AppBar(
                centerTitle: false,
                leadingWidth: 40.0,
                titleSpacing: 0.0,
                leading: DrawerIcon(
                    onPressed: () =>
                        cubit.scaffoldKey.currentState!.openDrawer()),
                title: HomeAppBarTitle(onPressed: () {
                  MagicRouter.navigateTo(const SearchView());
                }),
                // actions: const [FilterButton()],
              ),
              body: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  CategoryButtonsListView(cubit: cubit),
                  HomeCarousel(cubit: cubit),
                  SectionHeader(
                    buttonText: "home.view_more".tr(),
                    headerText: "home.popular_food".tr(),
                    onPressed: () {},
                  ),
                  FoodItemCard(foodCardModel: foodCardModel),
                  SectionHeader(
                    buttonText: "home.view_more".tr(),
                    headerText: "home.brands".tr(),
                    onPressed: () {},
                  ),
                  RestaurantItemCard(restaurantItemModel: restaurantItemModel),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SectionHeader(
                      buttonText: '',
                      headerText: "home.special_offers".tr(),
                      showButton: false,
                      onPressed: () {},
                    ),
                  ),
                  FoodItemCard(foodCardModel: foodCardModel),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: HomeCarousel(cubit: cubit),
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
