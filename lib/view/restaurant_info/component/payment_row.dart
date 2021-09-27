import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'payment_icons.dart';

class PaymentRow extends StatelessWidget {
  final String text;
  const PaymentRow({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                const FaIcon(FontAwesomeIcons.creditCard, size: 20),
                const SizedBox(width: 8),
                Text(text,
                    style: const TextStyle(fontSize: 16, color: Colors.black)),
              ],
            ),
          ),
          const PaymentIcons()
        ],
      ),
    );
  }
}
