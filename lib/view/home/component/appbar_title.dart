// ignore: implementation_imports
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarTitle extends StatelessWidget {
  final VoidCallback onPressed;
  const AppBarTitle({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton.icon(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        onPressed: onPressed,
        icon: const FaIcon(
          FontAwesomeIcons.search,
          size: 12.0,
        ),
        label: Text(
          "home.search_bar".tr(),
          maxLines: 1,
          softWrap: true,
          textAlign: TextAlign.start,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
