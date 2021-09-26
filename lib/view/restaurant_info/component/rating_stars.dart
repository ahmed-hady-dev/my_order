import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RatingStars extends StatelessWidget {
   final double iconSize;

  const RatingStars({Key? key, required this.iconSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      FaIcon(
        FontAwesomeIcons.solidStar,
        color: Colors.red,
        size: iconSize,
      ),
      FaIcon(
        FontAwesomeIcons.solidStar,
        color: Colors.red,
        size: iconSize,
      ),
      FaIcon(
        FontAwesomeIcons.solidStar,
        color: Colors.red,
        size: iconSize,
      ),
      FaIcon(
        FontAwesomeIcons.solidStar,
        color: Colors.red,
        size: iconSize,
      ),
      FaIcon(
        FontAwesomeIcons.solidStar,
        color: Colors.red,
        size: iconSize,
      )
    ]);
  }
}
