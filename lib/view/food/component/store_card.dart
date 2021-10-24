import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/widgets/stars_bar.dart';

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
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.clock,
                              size: 12.0,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              "restaurant.open_at".tr() +
                                  ' ' +
                                  DateFormat.jm().format(DateTime.parse(open)),
                              style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.clock,
                              size: 12.0,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              "restaurant.close_at".tr() +
                                  ' ' +
                                  DateFormat.jm().format(DateTime.parse(close)),
                              style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 5,
                // ),
                // Row(
                //   children: [
                //     Container(
                //       height: 12.0,
                //       width: 12.0,
                //       decoration: BoxDecoration(
                //         color: Colors.green,
                //         shape: BoxShape.circle,
                //         border: Border.all(
                //           width: 2.0,
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 5,
                //     ),
                //     const Text(
                //       "Online",
                //       style:
                //           TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                //     )
                //   ],
                // ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
