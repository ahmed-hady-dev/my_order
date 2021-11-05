// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/change_password/change_password_view.dart';
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
        child: BlocBuilder<UserDetailsCubit, UserDetailsState>(
          builder: (context, state) {
            final cubit = UserDetailsCubit.get(context);
            return Scaffold(
              appBar: AppBar(title: Text("user_details.appBar_title".tr())),
              body: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    UserProfileImage(cubit: cubit),
                    const SizedBox(height: 8),
                    Center(
                        child: Text(CacheHelper.userName,
                            style: const TextStyle(fontSize: 18.0))),
                    const UserDetailsForm(),
                    // MainButton(
                    //   text: "user_details.edit".tr(),
                    //   onPressed: () {
                    //     //TODO: add the edit function here
                    //   },
                    // ),
                    const SizedBox(height: 12),
                    Text("user_details.security_information".tr(),
                        style: const TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: OutlinedButton(
                          onPressed: () =>
                              MagicRouter.navigateTo(BlocProvider.value(
                                value: UserDetailsCubit.get(context),
                                child: const ChangePasswordView(),
                              )),
                          style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text("user_details.change_password".tr(),
                              style: const TextStyle(fontSize: 16.0))),
                    ),
                  ]),
            );
          },
        ),
      ),
    );
  }
}
