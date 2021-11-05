import 'package:flutter/material.dart';
import 'package:my_order/view/store/model/items_model.dart';
import '../../../core/router/router.dart';
import '../../order/order_view.dart';
import '../model/food_category_model.dart';
import '../widgets/food_category_card.dart';

class FoodCategoryListView extends StatelessWidget {

  final List<Item> items;
  const FoodCategoryListView({
    required this.items,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return FoodCategoryCard(
          name: item.name!,
          // TODO: Price
          price: 100,
          image: item.image!,
          description: item.description!,
          onTap: () => MagicRouter.navigateTo(OrderView(
            itemId: item.id!,
            image: item.image!,
            // TODO: Price
            price: 100,
            name: item.name!,
            description: item.description!,
          )),
        );
      },
    );
  }
}
