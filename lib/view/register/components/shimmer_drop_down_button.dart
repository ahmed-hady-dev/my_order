import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDropDownButton extends StatelessWidget {
  const ShimmerDropDownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 2),
      child: Container(
        height: 50,
        decoration: ShapeDecoration(
          color: Colors.grey[400]!,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    );
  }
}
