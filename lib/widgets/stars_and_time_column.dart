import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'stars_bar.dart';

class StarsAndTimeColumn extends StatelessWidget {
  final String timeText;
  final double stars;
  const StarsAndTimeColumn({
    Key? key,
    required this.timeText,
    required this.stars,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          StarsBar(stars: stars),
          const SizedBox(height: 8.0),
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.clock,
                size: 12.0,
              ),
              const SizedBox(width: 4.0),
              Text(
                timeText,
                style: const TextStyle(
                    fontSize: 8.0, fontWeight: FontWeight.normal),
              ),
            ],
          )
        ],
      ),
    );
  }
}
