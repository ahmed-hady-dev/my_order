import 'package:flutter/material.dart';
import '../../../core/router/router.dart';
import '../../order/order_view.dart';
import '../model/food_category_model.dart';
import '../widgets/food_category_card.dart';

class FoodCategoryListView extends StatelessWidget {
  const FoodCategoryListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: foodCategoryList.length,
      itemBuilder: (context, index) => FoodCategoryCard(
        name: foodCategoryList[index].name,
        price: foodCategoryList[index].price,
        image: foodCategoryList[index].image,
        description: foodCategoryList[index].description,
        onTap: () => MagicRouter.navigateTo(OrderView(
          image: foodCategoryList[index].image,
          price: foodCategoryList[index].price,
          name: foodCategoryList[index].name,
          description: foodCategoryList[index].description,
        )),
      ),
    );
  }
}
