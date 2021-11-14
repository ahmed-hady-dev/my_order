// ignore_for_file: implementation_imports

import 'dart:async';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/view/login/login_view.dart';
import '../../core/cacheHelper/cache_helper.dart';
import '../home/home_view.dart';

import '../../constants/app_colors.dart';
import '../../core/router/router.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool _visible = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1), () {
      setState(() {
        _visible = !_visible;
      });
      debugPrint('token : ' + (CacheHelper.getUserToken ?? ''));
      debugPrint('lang : ' + MagicRouter.currentContext!.locale.languageCode);
    });
    Timer(const Duration(milliseconds: 2500), () {
      MagicRouter.navigateAndPopAll(
          CacheHelper.isLogged ? const HomeView() : const LoginView());
    });
    checkAvailability();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 64.0, end: 64.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.redColor, AppColors.redGradientColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: AnimatedOpacity(
            duration: const Duration(milliseconds: 2000),
            opacity: _visible ? 1.0 : 0.0,
            child: Image.asset('assets/images/splash_icon.png')),
      ),
    );
  }
}
