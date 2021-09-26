import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double fontSize;
  const HeaderText({
    Key? key,
    required this.text,
    this.fontSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}
