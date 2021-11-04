import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class StoreTime extends StatelessWidget {
  const StoreTime({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FaIcon(
          FontAwesomeIcons.clock,
          size: 12.0,
          color: color,
        ),
        const SizedBox(width: 4.0),
        Text(
          text,
          style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
