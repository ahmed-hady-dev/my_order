// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/view/drawer/drawer.dart';
import 'package:my_order/view/home/component/item_card_shimmer.dart';
import 'package:my_order/view/home/component/popular_brands_card_shimmer.dart';
import 'package:my_order/view/home/component/special_offer_card.dart';
import 'package:my_order/view/home/controller/home_cubit.dart';
import 'package:my_order/view/home/widgets/section_header.dart';
import 'package:my_order/widgets/nothing_widget.dart';
import 'component/buttons_shimmer.dart';
import 'component/home_appbar.dart';
import 'component/category_buttons_listview.dart';
import 'component/item_card.dart';
import 'component/popular_brand_near_you_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => HomeCubit()
          ..getStoreCategories()
          ..getPopularBrands()
          ..getPopularFood()
          ..getSpecialOffers(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final cubit = HomeCubit.get(context);
            return Scaffold(
              key: cubit.scaffoldKey,
              drawer: const NavigationDrawer(),
              appBar: homeAppBar(cubit),
              body: ListView(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  cubit.storeCategoriesModel == null
                      ? const ButtonsShimmer()
                      : cubit.storeCategoriesModel!.data!.isEmpty
                          ? NothingWidget(color: Colors.grey.shade300)
                          : CategoryButtonsListView(
                              storeCategoriesModel:
                                  cubit.storeCategoriesModel!),
                  // HomeCarousel(cubit: cubit),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SectionHeader(
                      showButton: false,
                      buttonText: '',
                      headerText: "home.popular_food".tr(),
                      onPressed: () {},
                    ),
                  ),
                  cubit.popularFoodModel == null
                      ? const ItemCardShimmer()
                      : ItemCard(cubit: cubit),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SectionHeader(
                      buttonText: '',
                      headerText: "home.brands".tr(),
                      onPressed: () {},
                      showButton: false,
                    ),
                  ),
                  cubit.popularBrandsModel == null
                      ? const PopularBrandsCardShimmer()
                      : cubit.popularBrandsModel!.data!.isEmpty
                          ? NothingWidget(color: Colors.grey.shade300)
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
                  cubit.specialOffersModel == null
                      ? const ItemCardShimmer()
                      : cubit.specialOffersModel!.data!.isEmpty
                          ? NothingWidget(color: Colors.grey.shade300)
                          : SpecialOfferCard(cubit: cubit),
                  const SizedBox(height: 20.0),
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
