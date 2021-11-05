// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/constants/app_colors.dart';

class NothingWidget extends StatelessWidget {
  const NothingWidget({
    Key? key,
    this.horizontalPadding = 16.0,
    this.iconSize = 26.0,
    required this.color,
  }) : super(key: key);
  final double horizontalPadding;
  final double? iconSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        height: 140.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), color: color),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FaIcon(
              FontAwesomeIcons.search,
              color: AppColors.redColor,
              size: iconSize,
            ),
            const SizedBox(width: 8),
            Text("home.nothing".tr(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0))
          ],
        ),
      ),
    );
  }
}
