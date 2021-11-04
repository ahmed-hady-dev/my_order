// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/splash/splash_view.dart';
import 'component/language_row.dart';
import 'component/notification_row.dart';
import 'controller/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SettingsCubit(),
        child: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            final cubit = SettingsCubit.get(context);
            if (context.locale.languageCode == 'ar') {
              cubit.langDropdownValue = 'العربية';
            }
            return Scaffold(
              appBar: AppBar(
                title: Text("settings.appBar_title".tr()),
              ),
              body: Column(
                children: <Widget>[
                  NotificationRow(
                      value: cubit.notificationToggle,
                      onChanged: (value) =>
                          cubit.changeNotificationToggle(value: value)),
                  const Divider(),
                  SettingsRow(
                    text: "settings.lang".tr(),
                    hint: context.locale.languageCode == 'en'
                        ? 'English'
                        : 'العربية',
                    list: cubit.langList,
                    value: cubit.langDropdownValue,
                    onChanged: (newValue) {
                      cubit.changeLangDropDown(value: newValue!);
                      if (newValue == 'العربية') {
                        context.setLocale(const Locale('ar', 'EG'));
                        MagicRouter.navigateAndPopAll(const SplashView());
                      } else if (newValue == 'English') {
                        context.setLocale(const Locale('en', 'US'));
                        MagicRouter.navigateAndPopAll(const SplashView());
                      }
                    },
                  ),
                  const Divider(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
