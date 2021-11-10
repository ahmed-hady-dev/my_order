import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../widgets/shimmer_category_button.dart';

class ButtonsShimmer extends StatelessWidget {
  const ButtonsShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52.0,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: const <Widget>[
            SizedBox(width: 8),
            ShimmerCategoryButton(),
            ShimmerCategoryButton(),
            ShimmerCategoryButton(),
          ]),
    );
  }
}

class SliderShimmer extends StatelessWidget {
  const SliderShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        direction: ShimmerDirection.ltr,
        period: const Duration(seconds: 2),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: ShapeDecoration(
            color: Colors.grey[400]!,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
