import 'package:flutter/material.dart';

class FoodSectionHeader extends StatelessWidget {
  final String text;
  final double fontSize;

  const FoodSectionHeader(
      {Key? key, required this.text, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 16, bottom: 20),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}
