import 'package:flutter/material.dart';

class HelpExpansionTile extends StatelessWidget {
  const HelpExpansionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      tilePadding: EdgeInsets.all(0),
      childrenPadding: EdgeInsets.all(0),
      title: Text(
        'I need help with a current order?',
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            'You can contact our customer support service and they can help you.',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
