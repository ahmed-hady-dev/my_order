import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/app_colors.dart';
import '../../../core/router/router.dart';
import '../../home/component/home_appbar_title.dart';
import '../../map/map_view.dart';
import '../../search/search_view.dart';

AppBar appBarFoodSection() {
  return AppBar(
    centerTitle: false,
    leadingWidth: 40.0,
    titleSpacing: 0.0,
    title: HomeAppBarTitle(
        onPressed: () => MagicRouter.navigateTo(const SearchView())),
    actions: [
      const SizedBox(width: 8.0),
      const Center(
        child: Text(
          //TODO: add the address here from api
          'El-Galla St',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
        ),
      ),
      IconButton(
        padding: const EdgeInsets.all(4.0),
        constraints: const BoxConstraints(),
        icon: const FaIcon(
          FontAwesomeIcons.mapMarkerAlt,
          color: AppColors.redColor,
          size: 14,
        ),
        tooltip: 'choose location on place',
        onPressed: () => MagicRouter.navigateTo(const MapView()),
      ),
    ],
  );
}
