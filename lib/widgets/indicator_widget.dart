import 'package:flutter/cupertino.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key? key,
    this.radius = 16.0,
  }) : super(key: key);
  final double radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: MediaQuery.of(context).size.width,
      child: Center(
          child: CupertinoActivityIndicator(
        radius: radius,
        animating: true,
      )),
    );
  }
}
