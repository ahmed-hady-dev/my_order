import 'package:flutter/material.dart';

import 'store_card.dart';

class AllRestaurants extends StatelessWidget {
  const AllRestaurants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20.0);
        },
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            child: StoreCard(
              image: 'http://via.placeholder.com/200x200?text=No+Image',
              name: 'gedo',
              description: 'pastapastapastapastapastapastapastapasta',
              rate: 2.5,
              closeAt: "20:00:00",
              openAt: "08:00:00",
            ),
          );
        });
  }
}
