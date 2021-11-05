import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double fontSize;
  final double bottom;
  final double top;
  const HeaderText({
    Key? key,
    required this.text,
    this.fontSize = 18.0,
    this.bottom = 4.0,
    this.top = 8.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, bottom: bottom),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}
