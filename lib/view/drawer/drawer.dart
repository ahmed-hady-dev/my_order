import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/app_colors.dart';
import 'component/drawer_body.dart';
import 'component/drawer_footer.dart';
import 'controller/drawer_cubit.dart';
import 'widget/drawer_header_body.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        return Drawer(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [AppColors.redColor, AppColors.redGradientColor]),
            ),
            child: ListView(
              padding: EdgeInsets.zero,
              children: const [
                DrawerHeaderBody(),
                DrawerBody(),
                SizedBox(height: 20),
                DrawerFooter(),
              ],
            ),
          ),
        );
      },
    );
  }
}
