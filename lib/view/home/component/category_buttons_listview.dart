import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/router/router.dart';
import '../../food/food_view.dart';
import '../controller/home_cubit.dart';
import '../model/category_button.dart';

class CategoryButtonsListView extends StatelessWidget {
  const CategoryButtonsListView({
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final HomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36.0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: categoryButtonModel.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(elevation: 0.0),
            onPressed: () {
              //TODO: insert the on pressed function
              MagicRouter.navigateTo(const FoodView());
            },
            label: Text(
              categoryButtonModel[index].categoryName,
              style:
                  const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w300),
            ),
            icon: FaIcon(
              categoryButtonModel[index].categoryIcon,
              size: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
