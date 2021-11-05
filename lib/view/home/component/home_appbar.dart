import 'package:flutter/material.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/home/controller/home_cubit.dart';
import 'package:my_order/view/search/search_view.dart';
import 'package:my_order/widgets/drawer_icon.dart';

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
