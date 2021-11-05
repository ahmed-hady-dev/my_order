import 'package:flutter/material.dart';
import 'package:my_order/view/store/model/items_model.dart';
import '../../../core/router/router.dart';
import '../../order/order_view.dart';
import '../widgets/food_category_card.dart';

class FoodCategoryListView extends StatelessWidget {
  final List<Item> items;
  final int storeId;
  const FoodCategoryListView({
    required this.items,
    Key? key, required this.storeId,
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
            storeId: storeId,
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
