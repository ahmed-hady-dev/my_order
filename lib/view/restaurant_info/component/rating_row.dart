import 'package:flutter/material.dart';

import '../../../widgets/stars_bar.dart';

class RatingRow extends StatelessWidget {
  final double stars;
  final String ratingText;
  const RatingRow({
    Key? key,
    required this.stars,
    required this.ratingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          StarsBar(stars: stars),
          SizedBox(
            width: 120,
            child: Text(
              ratingText,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 16, color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
