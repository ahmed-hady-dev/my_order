import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/store_categories_model.dart';
import '../../../core/router/router.dart';
import '../../food/food_view.dart';
import '../controller/home_cubit.dart';

class CategoryButtonsListView extends StatelessWidget {
  const CategoryButtonsListView({
    Key? key,
    required this.storeCategoriesModel,
  }) : super(key: key);
  final StoreCategoriesModel storeCategoriesModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: storeCategoriesModel.data!.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(elevation: 0.0),
            onPressed: () {
              MagicRouter.navigateTo(BlocProvider.value(
                value: HomeCubit()
                  ..getStoreSubCategoriesById(
                      id: storeCategoriesModel.data![index].id.toString())
                  ..getStoreOfCategory(
                      categoryId:
                          storeCategoriesModel.data![index].id.toString()),
                child: const FoodView(),
              ));
            },
            label: Text(
              storeCategoriesModel.data![index].name.toString(),
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            icon: SizedBox(
              height: 20.0,
              width: 30.0,
              child: Image.network(
                  storeCategoriesModel.data![index].image.toString(),
                  fit: BoxFit.cover),
            ),
          ),
        ),
      ),
    );
  }
}
