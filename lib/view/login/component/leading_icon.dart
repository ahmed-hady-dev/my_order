import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/app_colors.dart';
import '../../../core/router/router.dart';

class LeadingIcon extends StatelessWidget {
  const LeadingIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const IconButton(
        onPressed: MagicRouter.pop,
        icon: Icon(
          FontAwesomeIcons.arrowLeft,
          color: AppColors.blackColor,
        ));
  }
}
