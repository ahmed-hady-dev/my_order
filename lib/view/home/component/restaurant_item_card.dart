import 'package:flutter/material.dart';
import '../model/restaurant_item_model.dart';

class RestaurantItemCard extends StatelessWidget {
  final List<RestaurantItemModel> restaurantItemModel;
  const RestaurantItemCard({Key? key, required this.restaurantItemModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 136.0,
      child: ListView.builder(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: restaurantItemModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(restaurantItemModel[index].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          restaurantItemModel[index].name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
