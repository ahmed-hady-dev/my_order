// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';
import 'package:my_order/view/drawer/widget/user_avatar.dart';
import '../../login/login_view.dart';
import '../../order/controller/order_cubit.dart';
import '../../../core/router/router.dart';
import '../../cart/cart_view.dart';
import '../../settings/settings_view.dart';
import 'empty_avatar.dart';

class DrawerHeaderBody extends StatelessWidget {
  const DrawerHeaderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            MagicRouter.pop();
            MagicRouter.navigateTo(BlocProvider.value(
              value: OrderCubit.get(context),
              child: const CartView(),
            ));
          },
          icon:
              const FaIcon(FontAwesomeIcons.shoppingCart, color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Column(
            children: <Widget>[
              CacheHelper.isLogged ? const UserAvatar() : const EmptyAvatar(),
              const SizedBox(height: 8),
              InkWell(
                onTap: CacheHelper.isLogged
                    ? () {}
                    : () => MagicRouter.navigateAndPopUntilFirstPage(
                        const LoginView()),
                child: SizedBox(
                  width: 160,
                  child: Text(
                    CacheHelper.isLogged
                        ? CacheHelper.userFirstName
                        : "drawer.login".tr(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {
            MagicRouter.pop();
            MagicRouter.navigateTo(const SettingsView());
          },
          icon: const FaIcon(FontAwesomeIcons.cog, color: Colors.white),
        ),
      ],
    );
  }
}
