import 'package:flutter/material.dart';

class RestaurantName extends StatelessWidget {
  final String name;
  final double horizontalPadding;
  final double verticalPadding;
  const RestaurantName({
    Key? key,
    required this.name,
    this.horizontalPadding = 4.0,
    this.verticalPadding = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Text(
        name,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
