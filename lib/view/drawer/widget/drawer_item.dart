// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/view/drawer/controller/drawer_cubit.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final int selected;
  final GestureTapCallback onTap;

  const DrawerItem({
    Key? key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerCubit, DrawerState>(
      builder: (context, state) {
        DrawerCubit drawerCubit = DrawerCubit.get(context);
        return Container(
          width: 250,
          height: 50,
          decoration: drawerCubit.isSelected == selected
              ? BoxDecoration(
                  color: Colors.black,
                  borderRadius: context.locale == const Locale('en', 'US')
                      ? const BorderRadius.horizontal(
                          right: Radius.circular(30),
                        )
                      : const BorderRadius.horizontal(
                          left: Radius.circular(30),
                        ),
                )
              : const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(30),
                  ),
                ),
          child: ListTile(
            title: Row(
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            onTap: onTap,
          ),
        );
      },
    );
  }
}
