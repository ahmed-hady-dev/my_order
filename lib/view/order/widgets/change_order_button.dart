import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../constants/app_colors.dart';

class ChangeOrderButton extends StatelessWidget {
  const ChangeOrderButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.iconSize = 28.0,
    this.constraints = const BoxConstraints(
      minWidth: kMinInteractiveDimension,
      minHeight: kMinInteractiveDimension,
    ),
  }) : super(key: key);
  final VoidCallback onPressed;
  final IconData icon;
  final BoxConstraints? constraints;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      constraints: constraints!,
      iconSize: iconSize!,
      alignment: Alignment.center,
      color: AppColors.redColor,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      icon: FaIcon(icon),
    );
  }
}
