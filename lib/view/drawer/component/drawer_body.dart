// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/about/about_view.dart';
import 'package:my_order/view/drawer/controller/drawer_cubit.dart';
import 'package:my_order/view/drawer/widget/drawer_item.dart';
import 'package:my_order/view/help/help_view.dart';
import 'package:my_order/view/home/home_view.dart';
import 'package:my_order/view/login/login_view.dart';
import 'package:my_order/view/map_intro/map_intro.dart';
import 'package:my_order/view/notifications/notifications_view.dart';
import 'package:my_order/view/offers/offers_view.dart';
import 'package:my_order/view/orders/orders_view.dart';
import 'package:my_order/view/user_details/user_details_view.dart';
import 'package:my_order/view/vouchers/vouchers_view.dart';

class DrawerBody extends StatelessWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DrawerItem(
          selected: 0,
          icon: Icons.home,
          text: "drawer.home".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(0);
            MagicRouter.pop();
            MagicRouter.navigateAndPopAll(const HomeView());
          },
        ),
        DrawerItem(
          selected: 1,
          icon: Icons.person,
          text: "drawer.profile".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(1);
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const UserDetailsView());
          },
        ),
        DrawerItem(
          selected: 2,
          icon: Icons.location_pin,
          text: "drawer.location".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(2);
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const MapIntro());
          },
        ),
        DrawerItem(
          selected: 3,
          icon: FontAwesomeIcons.clipboardList,
          text: "drawer.your_orders".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(3);
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const OrdersView());
          },
        ),
        DrawerItem(
          selected: 4,
          icon: Icons.local_offer_rounded,
          text: "drawer.offers".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(4);
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const OffersView());
          },
        ),
        DrawerItem(
          selected: 5,
          icon: Icons.notifications,
          text: "drawer.notifications".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(5);
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const NotificationsView());
          },
        ),
        DrawerItem(
          selected: 6,
          icon: FontAwesomeIcons.ticketAlt,
          text: "drawer.vouchers".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(6);
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const VouchersView());
          },
        ),
        DrawerItem(
          selected: 7,
          icon: FontAwesomeIcons.bullhorn,
          text: "drawer.get_help".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(7);
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const HelpView());
          },
        ),
        DrawerItem(
          selected: 8,
          icon: Icons.info_outline,
          text: "drawer.about_us".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(8);
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const AboutView());
          },
        ),
        DrawerItem(
          selected: 9,
          icon: Icons.login,
          text: "drawer.login".tr(),
          onTap: () {
            DrawerCubit.get(context).itemSelection(9);
            MagicRouter.pop();
            MagicRouter.navigateAndPopUntilFirstPage(const LoginView());
          },
        ),
      ],
    );
  }
}
