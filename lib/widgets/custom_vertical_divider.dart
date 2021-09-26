import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({
    Key? key,
    this.height = 12.0,
    this.width = 1.0,
    this.color = Colors.grey,
  }) : super(key: key);
  final double height;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      color: color,
    );
  }
}
