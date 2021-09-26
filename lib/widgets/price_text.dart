import 'package:flutter/material.dart';

class PriceText extends StatelessWidget {
  final String price;
  final double fontSize;
  final FontWeight? fontWeight;
  const PriceText({
    Key? key,
    required this.price,
    this.fontSize = 12.0,
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
      child: Text(
        price,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
