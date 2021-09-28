import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/app_colors.dart';
import '../../../core/router/router.dart';
import '../../map/map_view.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(4.0),
      constraints: const BoxConstraints(),
      icon: const FaIcon(
        FontAwesomeIcons.mapMarkerAlt,
        color: AppColors.redColor,
        size: 16,
      ),
      tooltip: 'choose location on place',
      onPressed: () => MagicRouter.navigateTo(const MapView()),
    );
  }
}
