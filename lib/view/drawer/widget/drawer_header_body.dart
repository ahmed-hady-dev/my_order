import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../login/login_view.dart';
import '../../order/controller/order_cubit.dart';
import '../../../core/router/router.dart';
import '../../cart/cart_view.dart';
import '../../settings/settings_view.dart';

class DrawerHeaderBody extends StatelessWidget {
  const DrawerHeaderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
                child: const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  foregroundColor: Colors.white,
                  radius: 30,
                  child: Center(
                      child: Icon(
                    Icons.person_outline,
                    size: 30,
                  )),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () =>
                    MagicRouter.navigateAndPopUntilFirstPage(const LoginView()),
                child: const Text(
                  //TODO: add the user name here
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
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
