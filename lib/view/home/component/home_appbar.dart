import 'package:flutter/material.dart';
import '../../../core/router/router.dart';
import '../controller/home_cubit.dart';
import '../../search/search_view.dart';
import '../../../widgets/drawer_icon.dart';

import 'home_appbar_title.dart';

AppBar homeAppBar(HomeCubit cubit) {
  return AppBar(
    centerTitle: false,
    leadingWidth: 40.0,
    titleSpacing: 0.0,
    leading: DrawerIcon(
        onPressed: () => cubit.scaffoldKey.currentState!.openDrawer()),
    title: HomeAppBarTitle(onPressed: () {
      MagicRouter.navigateTo(const SearchView());
    }),
  );
}
