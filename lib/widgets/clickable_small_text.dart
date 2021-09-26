import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class ClickableSmallText extends StatelessWidget {
  const ClickableSmallText({
    Key? key,
    required this.text,
    required this.onTap,
    this.fontSize = 12.0,
    this.color = AppColors.redColor,
    this.fontWeight = FontWeight.normal,
    this.decoration = TextDecoration.none,
    this.decorationThickness = 0.0,
  }) : super(key: key);
  final String text;
  final double fontSize;
  final double? decorationThickness;
  final Color color;
  final FontWeight fontWeight;
  final Function onTap;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Text(
        text,
        style: TextStyle(
            fontSize: fontSize,
            color: color,
            fontWeight: fontWeight,
            decoration: decoration,
            decorationThickness: decorationThickness),
      ),
    );
  }
}
