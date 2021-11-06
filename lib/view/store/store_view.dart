import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../food/model/store_model.dart';
import '../../widgets/loading_indicator.dart';
import 'component/food_category_listview.dart';
import 'component/food_category_tab_bar.dart';
import 'component/food_image.dart';
import 'component/main_header.dart';
import 'component/offer_button.dart';
import 'controller/store_cubit.dart';

class StoreView extends StatefulWidget {
  final StoreModelData storeModelData;
  const StoreView({Key? key, required this.storeModelData}) : super(key: key);

  @override
  State<StoreView> createState() => _StoreViewState();
}

class _StoreViewState extends State<StoreView> {
  final cubit = StoreCubit();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => cubit
          ..getItems(storeId: widget.storeModelData.id!)
          ..getReviewByStoreId(storeId: widget.storeModelData.id!)
          ..getStoreOfferByStoreId(storeId: widget.storeModelData.id!),
        child: BlocBuilder<StoreCubit, StoreState>(
          builder: (context, state) {
            if (cubit.storeItemsModel == null) {
              return const Scaffold(
                body: LoadingIndicator(),
              );
            }
            final data = cubit.storeItemsModel!.data!;
            return DefaultTabController(
              length: data.length,
              child: Scaffold(
                appBar: AppBar(),
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FoodImage(image: widget.storeModelData.image!),
                    const SizedBox(height: 24.0),
                    MainHeader(
                        cubit: cubit, storeModelData: widget.storeModelData),
                    const SizedBox(height: 20.0),
                    OfferButton(
                        cubit: cubit, storeId: widget.storeModelData.id!),
                    FoodCategoryTabBar(list: data),
                    Flexible(
                      child: TabBarView(
                        children: data
                            .map((e) => FoodCategoryListView(
                                storeId: widget.storeModelData.id!,
                                items: e.items!))
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
