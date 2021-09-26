import 'package:flutter/material.dart';

class BoldHeader extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const BoldHeader({
    Key? key,
    required this.text,
    this.fontSize = 18.0,
    this.fontWeight = FontWeight.bold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
      ),
    );
  }
}
