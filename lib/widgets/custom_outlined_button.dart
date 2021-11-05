import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8))),
          child: Text(text, style: const TextStyle(fontSize: 16.0))),
    );
  }
}
