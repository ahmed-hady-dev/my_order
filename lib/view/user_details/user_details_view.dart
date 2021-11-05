// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/change_password/change_password_view.dart';
import 'package:my_order/widgets/custom_outlined_button.dart';
import 'package:my_order/widgets/header_text.dart';
import 'component/change_area_view.dart';
import 'component/user_details_form.dart';
import 'component/user_profile_image.dart';
import 'controller/user_details_cubit.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => UserDetailsCubit(),
        child: BlocConsumer<UserDetailsCubit, UserDetailsState>(
          listener: (context, state) {
            if (state is UserDetailsUpdateSuccessState) {
              if (state.userModel.status == 1) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("user_details.info_updated".tr()),
                    backgroundColor: Colors.green,
                  ),
                );
              }
            }
          },
          builder: (context, state) {
            final cubit = UserDetailsCubit.get(context);
            return Scaffold(
              appBar: AppBar(title: Text("user_details.appBar_title".tr())),
              body: RefreshIndicator(
                onRefresh: () async {
                  await cubit.refreshUserData();
                },
                child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    children: <Widget>[
                      UserProfileImage(cubit: cubit),
                      const SizedBox(height: 8),
                      Center(
                          child: Text(CacheHelper.userName,
                              style: const TextStyle(fontSize: 18.0))),
                      const UserDetailsForm(),
                      HeaderText(
                        text: "user_details.your_area".tr() +
                            toBeginningOfSentenceCase(CacheHelper
                                    .getUserInfo!.data!.area!.city!.name!
                                    .toString())
                                .toString() +
                            ', ' +
                            toBeginningOfSentenceCase(CacheHelper
                                    .getUserInfo!.data!.area!.name!
                                    .toString())
                                .toString(),
                        top: 16.0,
                      ),
                      CustomOutlinedButton(
                        text: "user_details.change_area".tr(),
                        onPressed: () =>
                            MagicRouter.navigateTo(BlocProvider.value(
                          value: cubit..getCity(),
                          child: const ChangeAreaView(),
                        )),
                      ),
                      const SizedBox(height: 12),
                      Text("user_details.security_information".tr(),
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold)),
                      CustomOutlinedButton(
                        text: "user_details.change_password".tr(),
                        onPressed: () =>
                            MagicRouter.navigateTo(BlocProvider.value(
                          value: cubit,
                          child: const ChangePasswordView(),
                        )),
                      ),
                    ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
