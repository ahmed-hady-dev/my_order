// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/widgets/main_button.dart';

import 'component/user_details_form.dart';
import 'controller/user_details_cubit.dart';

class UserDetailsView extends StatelessWidget {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => UserDetailsCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("user_details.appBar_title".tr()),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.grey.shade300,
                    radius: 50.0,
                    //TODO: add the user profile form api here
                    backgroundImage:
                        const AssetImage('assets/images/user_avatar.png'),
                  ),
                  //TODO: add the user name form api here
                  const Text(
                    'Ahmed Abd-ElHady',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const UserDetailsForm(),
                  MainButton(
                    text: "user_details.edit".tr(),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
