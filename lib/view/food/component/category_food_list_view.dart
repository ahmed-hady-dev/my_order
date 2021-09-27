import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../home/controller/home_cubit.dart';
import '../model/category_food_button.dart';

class CategoryFoodListView extends StatelessWidget {
  final HomeCubit cubit;

  const CategoryFoodListView({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categoryFoodButtonModel.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(elevation: 0.0),
            onPressed: () {
              //TODO: insert the on pressed function
            },
            label: Text(
              categoryFoodButtonModel[index].categoryName,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            icon: FaIcon(
              categoryFoodButtonModel[index].categoryIcon,
              size: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
