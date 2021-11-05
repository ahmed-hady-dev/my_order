// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/app_colors.dart';
import 'package:my_order/view/orders/widgets/recent_orders.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'controller/orders_cubit.dart';
import 'widgets/old_orders.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => OrdersCubit(),
        child: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            final cubit = OrdersCubit.get(context);
            return Scaffold(
                appBar: AppBar(title: Text("orders.appBar_title".tr())),
                body: SingleChildScrollView(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 40, right: 16, left: 16),
                    child: Column(
                      children: [
                        ToggleSwitch(
                          minWidth: double.infinity,
                          cornerRadius: 20.0,
                          minHeight: 46,
                          fontSize: 18,
                          activeBgColors: const [
                            [AppColors.redColor],
                            [AppColors.redColor]
                          ],
                          activeFgColor: Colors.white,
                          inactiveFgColor: Colors.white,
                          inactiveBgColor: AppColors.redColor.withOpacity(0.5),
                          initialLabelIndex: cubit.labelSelect ? 1 : 0,
                          totalSwitches: 2,
                          labels: const ['Old Orders', 'Recent Orders'],
                          radiusStyle: true,
                          onToggle: cubit.itemSelection,
                        ),
                        cubit.isSelected == 0
                            ? const OldOrders()
                            : const RecentOrders(),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }
}
