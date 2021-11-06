import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../widgets/store_time.dart';
import '../../../widgets/stars_bar.dart';

class StoreCard extends StatelessWidget {
  const StoreCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.description,
      required this.rate,
      required this.openAt,
      required this.closeAt,
      this.vertical = 0})
      : super(key: key);
  final String image;
  final String name;
  final String description;
  final double rate;
  final String openAt;
  final String closeAt;

  final double vertical;
  @override
  Widget build(BuildContext context) {
    String open = "2020-07-20T$openAt";
    String close = "2020-07-20T$closeAt";
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: vertical),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.redAccent),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 90.0,
            width: 90.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                // width: 110.0,
              ),
            ),
          ),
          Flexible(
              child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 4),
                    StarsBar(stars: rate),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 12),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        StoreTime(
                            color: Colors.green,
                            text: "restaurant.open_at".tr() +
                                ' ' +
                                DateFormat.jm().format(DateTime.parse(open))),
                        const SizedBox(height: 4),
                        StoreTime(
                            color: Colors.red,
                            text: "restaurant.close_at".tr() +
                                ' ' +
                                DateFormat.jm().format(DateTime.parse(close))),
                      ],
                    ),
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
