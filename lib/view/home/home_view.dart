// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/drawer/drawer.dart';
import 'package:my_order/view/home/component/popular_brands_card_shimmer.dart';
import 'package:my_order/view/home/controller/home_cubit.dart';
import 'package:my_order/view/home/model/food_card_model.dart';
import 'package:my_order/view/home/widgets/section_header.dart';
import 'package:my_order/view/search/search_view.dart';
import 'package:my_order/widgets/drawer_icon.dart';
import 'package:my_order/widgets/no_result_widget.dart';
import 'component/buttons_shimmer.dart';
import 'component/home_appbar_title.dart';
import 'component/category_buttons_listview.dart';
import 'component/food_item_card.dart';
import 'component/popular_brand_near_you_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()
          ..getStoreCategories()
          ..getPopularBrands(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state is GetStoreCategoriesLoading) {
              debugPrint('loading.........................');
            }
          },
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
                  cubit.storeCategoriesModel == null
                      ? const ButtonsShimmer()
                      : CategoryButtonsListView(
                          storeCategoriesModel: cubit.storeCategoriesModel!),
                  // HomeCarousel(cubit: cubit),
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
                  cubit.popularBrandsModel == null
                      ? const PopularBrandsCardShimmer()
                      : cubit.popularBrandsModel!.data!.isEmpty
                          ? NoResultsWidget(text: "search.no_results".tr())
                          : PopularBrandNearYouListView(cubit: cubit),
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// the bottom carousel
// Padding(
//   padding: const EdgeInsets.symmetric(vertical: 16.0),
//   child: HomeCarousel(cubit: cubit),
// ),
