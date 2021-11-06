import 'package:flutter/material.dart';
import '../../store/model/store_review_model.dart';

import '../component/all_rev_card.dart';

class AllRevTile extends StatelessWidget {
  const AllRevTile({Key? key, required this.storeReviewModel})
      : super(key: key);
  final StoreReviewModel storeReviewModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 12.0),
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: storeReviewModel.data!.length,
        itemBuilder: (context, index) => AllRevCard(
            stars: double.parse(storeReviewModel.data![index]!.rate!),
            userName:
                storeReviewModel.data![index]!.client!.firstName!.toString() +
                    ' ' +
                    storeReviewModel.data![index]!.client!.lastName!.toString(),
            reviewText: storeReviewModel.data![index]!.comment.toString()));
  }
}
