import 'package:flutter/material.dart';

import '../../../widgets/stars_bar.dart';

class AllRevCard extends StatelessWidget {
  final double stars;
  final String userName;
  final String reviewText;
  const AllRevCard({
    Key? key,
    required this.stars,
    required this.userName,
    required this.reviewText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black.withOpacity(.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(userName,
                  style: const TextStyle(fontSize: 18, color: Colors.black54)),
              const SizedBox(height: 8.0),
              reviewText == 'null'
                  ? const SizedBox()
                  : Text(reviewText,
                      style: const TextStyle(color: Colors.black)),
            ],
          ),
          StarsBar(stars: stars),
        ],
      ),
    );
  }
}
