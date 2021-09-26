import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  late Function onPress;
  late Color color;
  late String text;
  late Color textColor;

  AppButton(
      {Key? key,
      required this.color,
      required this.onPress,
      required this.text,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPress(),
      child: Container(
        padding: const EdgeInsets.only(top: 15),
        height: 49,
        width: double.infinity,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
