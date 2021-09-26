import 'package:flutter/material.dart';

class SmallGreyText extends StatelessWidget {
  const SmallGreyText({
    Key? key,
    required this.text,
    this.color = Colors.grey,
    this.fontSize = 12.0,
  }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
