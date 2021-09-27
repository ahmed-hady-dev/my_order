import 'package:flutter/material.dart';

import '../component/all_rev_card.dart';

class AllRevTile extends StatelessWidget {
  const AllRevTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 12.0),
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: 15,
        itemBuilder: (context, index) => const AllRevCard(
            stars: 5, userName: "*Gannat B****", reviewText: "Amazing"));
  }
}
