import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {
  const ListSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(
          height: 20,
        ),
        Divider(
          color: Colors.red,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
