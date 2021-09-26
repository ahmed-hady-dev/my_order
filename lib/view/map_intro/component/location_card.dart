// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/home/home_view.dart';
import 'package:my_order/widgets/main_button.dart';

import 'location_row.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          width: double.infinity,
          height: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  "map_intro.choose_location".tr(),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              const LocationRow(),
              const SizedBox(height: 28.0),
              MainButton(
                  text: "map_intro.choose_location".tr(),
                  onPressed: () =>
                      MagicRouter.navigateAndPopAll(const HomeView())),
            ],
          ),
        ),
      ),
    );
  }
}
