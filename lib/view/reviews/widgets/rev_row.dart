import 'package:flutter/material.dart';
import '../../../widgets/stars_bar.dart';

class RevRow extends StatelessWidget {
  final String title;
  final double stars;
  final String rateText;

  const RevRow(
      {Key? key,
      required this.title,
      required this.stars,
      required this.rateText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 18, color: Colors.black)),
          Row(
            children: [
              StarsBar(stars: stars),
              const SizedBox(width: 4),
              Text(rateText, style: const TextStyle(fontSize: 16))
            ],
          ),
        ],
      ),
    );
  }
}
