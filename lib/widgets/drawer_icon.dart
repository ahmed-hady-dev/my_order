import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/app_colors.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const FaIcon(
        FontAwesomeIcons.bars,
        color: AppColors.redColor,
      ),
      onPressed: onPressed,
      tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
    );
  }
}
