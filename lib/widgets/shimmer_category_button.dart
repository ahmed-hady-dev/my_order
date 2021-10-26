import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryButton extends StatelessWidget {
  const ShimmerCategoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        direction: ShimmerDirection.ltr,
        period: const Duration(seconds: 2),
        child: Container(
          height: 36.0,
          width: 115.0,
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
