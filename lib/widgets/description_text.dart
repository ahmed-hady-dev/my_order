import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String description;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const DescriptionText({
    Key? key,
    required this.description,
    this.horizontalPadding = 4.0,
    this.verticalPadding = 0.0,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.w300,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      child: Text(
        description,
        style:
            TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),
      ),
    );
  }
}
