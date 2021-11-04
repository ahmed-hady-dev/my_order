import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StoresShimmer extends StatelessWidget {
  const StoresShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        children: const <Widget>[
          StoreCardShimmer(),
          StoreCardShimmer(),
          StoreCardShimmer(),
        ]);
  }
}

class StoreCardShimmer extends StatelessWidget {
  const StoreCardShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      direction: ShimmerDirection.ltr,
      period: const Duration(seconds: 2),
      child: Container(
        width: double.infinity,
        height: 90.0,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: ShapeDecoration(
          color: Colors.grey[400]!,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }
}
