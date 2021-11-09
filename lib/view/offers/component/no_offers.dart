import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, size: 52.0),
            const SizedBox(height: 8.0),
            Text(
              text,
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
