import 'package:flutter/material.dart';

import '../../../widgets/stars_bar.dart';

class StarsReviewRow extends StatelessWidget {
  final String text;
  final double stars;
  const StarsReviewRow({
    Key? key,
    required this.text,
    required this.stars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          StarsBar(stars: stars),
          SizedBox(
            width: 200.0,
            child: Text(
              text,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
