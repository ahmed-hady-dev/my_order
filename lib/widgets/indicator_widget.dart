import 'package:flutter/cupertino.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      width: MediaQuery.of(context).size.width,
      child: const Center(
          child: CupertinoActivityIndicator(
            radius: 16.0,
            animating: true,
          )),
    );
  }
}
