// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/view/food/component/stores_shimmer.dart';
import 'package:my_order/widgets/no_result_widget.dart';
import '../../core/router/router.dart';
import '../home/component/buttons_shimmer.dart';
import '../home/component/home_appbar_title.dart';
import '../search/search_view.dart';
import 'widgets/food_section_header.dart';
import '../home/controller/home_cubit.dart';

import 'component/all_stores.dart';
import 'component/category_food_list_view.dart';

class FoodView extends StatelessWidget {
  const FoodView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              titleSpacing: context.locale.languageCode == 'en' ? 12.0 : 1.0,
              leadingWidth: context.locale.languageCode == 'en' ? 24.0 : 50.0,
              title: HomeAppBarTitle(
                  onPressed: () => MagicRouter.navigateTo(const SearchView())),
            ),
            body: ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              children: [
                // TODO:
                // cubit.storeSubCategoriesModel == null
                //     ? const ButtonsShimmer()
                //     : CategoryFoodListView(cubit: cubit),

                // const FoodSectionHeader(text: "Fast delivery", fontSize: 25),
                // FoodItemCard(foodCardModel: foodCardModel),
                FoodSectionHeader(text: "food.all_stores".tr(), fontSize: 20),
                cubit.storeOfCategoryModel == null
                    ? const StoresShimmer()
                    : cubit.storeOfCategoryModel!.data!.isEmpty
                        ? NoResultsWidget(text: "search.no_results".tr())
                        : AllStores(cubit: cubit),
              ],
            ),
          );
        },
      ),
    );
  }
}
