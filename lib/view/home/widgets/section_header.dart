import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String headerText;
  final String buttonText;
  final VoidCallback onPressed;
  final bool showButton;
  const SectionHeader({
    Key? key,
    required this.headerText,
    required this.buttonText,
    required this.onPressed,
    this.showButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            headerText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          showButton
              ? OutlinedButton(
                  onPressed: onPressed,
                  child:
                      Text(buttonText, style: const TextStyle(fontSize: 12.0)),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
