// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class ActiveTabView extends StatelessWidget {
  const ActiveTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.local_offer_rounded,
                color: Colors.black, size: 36.0),
            const SizedBox(height: 12.0),
            Text("vouchers.no_vouchers_available".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0)),
            const SizedBox(height: 8.0),
            Text("vouchers.voucher_text".tr(),
                textAlign: TextAlign.center,
                softWrap: true,
                style: const TextStyle(
                    fontWeight: FontWeight.w300, fontSize: 18.0)),
          ],
        ),
      ),
    );
  }
}
