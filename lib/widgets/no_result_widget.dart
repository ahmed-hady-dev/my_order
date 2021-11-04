import 'package:flutter/material.dart';

class NoResultsWidget extends StatelessWidget {
  final String text;
  const NoResultsWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Icon(Icons.error_outline_rounded, size: 52.0),
        const SizedBox(height: 8.0),
        Text(
          text,
          style: Theme.of(context).textTheme.headline5,
        )
      ],
    );
  }
}
