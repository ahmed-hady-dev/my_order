import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/app_colors.dart';

class AllRestaurantsCard extends StatelessWidget {
  const AllRestaurantsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Row(
        children: [
          Container(
              width: 130,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage("assets/images/food_item.jpg"),
                      fit: BoxFit.fill))),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Gedoo",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    RatingBar.builder(
                      minRating: 1,
                      maxRating: 5.0,
                      initialRating: 3,
                      itemSize: 14.0,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: AppColors.redColor),
                      onRatingUpdate: (rating) {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Sandwich ,Males",
                        style: TextStyle(fontSize: 12)),
                    Row(
                      children: const [
                        FaIcon(
                          FontAwesomeIcons.clock,
                          size: 12.0,
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          "Within 24 mins",
                          style: TextStyle(
                              fontSize: 10.0, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Container(
                      height: 12.0,
                      width: 12.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                        border: Border.all(
                          width: 2.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      "Online",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
