import 'package:flutter/material.dart';

class StatusRow extends StatelessWidget {
  final String statusText;
  final double textHorizontal;
  final double textVertical;
  final double dotHorizontal;
  final double dotVertical;
  final Color textColor;
  const StatusRow({
    Key? key,
    required this.statusText,
    this.textHorizontal = 2.0,
    this.textVertical = 2.0,
    this.textColor = Colors.black,
    this.dotHorizontal = 4.0,
    this.dotVertical = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        statusText == 'online'
            ? Container(
                margin: EdgeInsets.symmetric(
                    vertical: textVertical, horizontal: textHorizontal),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
                height: 4.0,
                width: 4.0,
              )
            : Container(
                margin: EdgeInsets.symmetric(
                    vertical: textVertical, horizontal: textHorizontal),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
                height: 4.0,
                width: 4.0,
              ),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: textVertical, horizontal: textHorizontal),
          child: Text(
            statusText,
            style: TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
