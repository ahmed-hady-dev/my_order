import 'package:flutter/cupertino.dart';
import 'price_text.dart';
import 'status_row.dart';

import 'restaurant_name.dart';

class RestaurantInfoColumn extends StatelessWidget {
  final String statusText;
  final double price;
  final String name;

  const RestaurantInfoColumn({
    Key? key,
    required this.statusText,
    required this.price,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        RestaurantName(name: name),
        PriceText(price: price.toString()),
        StatusRow(statusText: statusText),
      ],
    );
  }
}
