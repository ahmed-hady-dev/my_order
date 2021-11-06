import 'package:flutter/material.dart';
import '../model/items_model.dart';
import '../../../core/router/router.dart';
import '../../order/order_view.dart';
import '../widgets/food_category_card.dart';

class FoodCategoryListView extends StatelessWidget {
  final int storeId;
  final List<Item> items;
  const FoodCategoryListView({
    Key? key,
    required this.items,
    required this.storeId,
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
          image: item.image!,
          description: item.description!,
          onTap: () => MagicRouter.navigateTo(OrderView(
            storeId: storeId,
            itemId: item.id!,
            image: item.image!,
            name: item.name!,
            description: item.description!,
          )),
        );
      },
    );
  }
}
