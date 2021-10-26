import 'package:flutter/material.dart';
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
