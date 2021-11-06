// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class NoOffers extends StatelessWidget {
  const NoOffers({Key? key}) : super(key: key);

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
              "offers.no_offers".tr(),
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }
}
