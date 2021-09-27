// ignore_for_file: implementation_imports

import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/constants/app_colors.dart';

class MoreDetailsButton extends StatelessWidget {
  const MoreDetailsButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: context.locale.languageCode == 'en'
            ? const EdgeInsets.only(right: 8.0)
            : const EdgeInsets.only(left: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
        decoration: BoxDecoration(
          color: AppColors.redColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Flexible(
          child: AutoSizeText(text,
              style: const TextStyle(fontSize: 12.0, color: Colors.white)),
        ),
      ),
    );
  }
}
