// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/view/reviews/widgets/rev_row.dart';

import 'component/all_rev_tile.dart';
import 'component/read_more_button.dart';
import 'component/stars_review_row.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("reviews.appBar_title".tr()),
        ),
        body: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 12.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const StarsReviewRow(
                      stars: 5.0, text: "Based on 2100 review"),
                  RevRow(
                    title: "reviews.order_packing".tr(),
                    stars: 4,
                    rateText: "4.0",
                  ),
                  RevRow(
                    title: "reviews.value_for_money".tr(),
                    stars: 4,
                    rateText: "4.0",
                  ),
                  RevRow(
                    title: "reviews.delivery_time".tr(),
                    stars: 4.5,
                    rateText: "4.5",
                  ),
                  RevRow(
                    title: "reviews.quality_of_food".tr(),
                    stars: 4,
                    rateText: "4.0",
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Text(
                        "reviews.rating_and_reviews".tr(),
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const AllRevTile(),
                  const ReadMoreButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
