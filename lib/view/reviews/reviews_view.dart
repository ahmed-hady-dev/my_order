// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/view/reviews/widgets/rate_dialog.dart';
import 'package:my_order/view/store/controller/restaurant_cubit.dart';
import 'package:my_order/widgets/loading_indicator.dart';

import 'component/all_rev_tile.dart';
import 'component/read_more_button.dart';
import 'component/stars_review_row.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView(
      {Key? key,
        required this.storeId,
      required this.rate,
      required this.reviewsNumber,
      required this.cubit})
      : super(key: key);
  final double rate;
  final int storeId;
  final int reviewsNumber;
  final RestaurantCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("reviews.appBar_title".tr()),
            actions: [
              IconButton(onPressed: (){
                showRateDialog(storeId, cubit);
              }, icon: Icon(Icons.rate_review)),
            ],
          ),
          body: cubit.storeReviewModel == null
              ? const LoadingIndicator()
              : ListView(
                  shrinkWrap: true,
                  children: [
                    const SizedBox(height: 12.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          StarsReviewRow(
                              stars: rate,
                              text: "reviews.based".tr() +
                                  reviewsNumber.toString() +
                                  ' ' +
                                  "reviews.review".tr()),
                          // RevRow(
                          //     title: "reviews.order_packing".tr(),
                          //     stars: 4,
                          //     rateText: "4.0"),
                          // RevRow(
                          //     title: "reviews.value_for_money".tr(),
                          //     stars: 4,
                          //     rateText: "4.0"),
                          // RevRow(
                          //     title: "reviews.delivery_time".tr(),
                          //     stars: 4.5,
                          //     rateText: "4.5"),
                          // RevRow(
                          //     title: "reviews.quality_of_food".tr(),
                          //     stars: 4,
                          //     rateText: "4.0"),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Text("reviews.rating_and_reviews".tr(),
                                  style: const TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold)),
                            ),
                          ),
                          AllRevTile(
                            storeReviewModel: cubit.storeReviewModel!,
                          ),
                          // const ReadMoreButton(),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
