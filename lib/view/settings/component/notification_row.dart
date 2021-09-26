// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_order/constants/app_colors.dart';

class NotificationRow extends StatelessWidget {
  final bool value;
  final Function onChanged;
  const NotificationRow({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "settings.notifications".tr(),
            style: const TextStyle(fontSize: 18.0),
          ),
          CupertinoSwitch(
            trackColor: AppColors.redColor.withOpacity(0.5),
            activeColor: AppColors.redColor,
            value: value,
            onChanged: (value) => onChanged(value),
          ),
        ],
      ),
    );
  }
}
