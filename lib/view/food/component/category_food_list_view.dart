import 'package:flutter/material.dart';

import '../../home/controller/home_cubit.dart';

class CategoryFoodListView extends StatelessWidget {
  final HomeCubit? cubit;

  const CategoryFoodListView({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: cubit!.storeSubCategoriesModel!.data!.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(elevation: 0.0),
            onPressed: () {},
            label: Text(
              cubit!.storeSubCategoriesModel!.data![index].name!.toString(),
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            icon: SizedBox(
              height: 20.0,
              width: 30.0,
              child: Image.network(
                cubit!.storeSubCategoriesModel!.data![index].image.toString(),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
