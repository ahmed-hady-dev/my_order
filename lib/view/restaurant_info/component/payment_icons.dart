import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentIcons extends StatelessWidget {
  const PaymentIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        FaIcon(FontAwesomeIcons.ccPaypal, color: Colors.red),
        SizedBox(width: 14),
        FaIcon(FontAwesomeIcons.ccVisa, color: Colors.blue),
        SizedBox(width: 14),
        FaIcon(FontAwesomeIcons.creditCard, color: Colors.black),
      ],
    );
  }
}
