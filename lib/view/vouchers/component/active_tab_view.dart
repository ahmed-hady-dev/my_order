// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/view/vouchers/controller/voucher_cubit.dart';
import 'package:my_order/view/vouchers/widgets/voucher_card.dart';
import 'package:my_order/widgets/indicator_widget.dart';

import 'no_voucher_widget.dart';

class ActiveTabView extends StatelessWidget {
  const ActiveTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoucherCubit, VoucherState>(
      builder: (context, state) {
        final cubit = VoucherCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: cubit.activeVoucherModel == null
              ? const Center(child: IndicatorWidget())
              : cubit.activeVoucherModel!.data!.isEmpty
                  ? const NoVoucherWidget()
                  : ListView.separated(
                      itemCount: cubit.activeVoucherModel!.data!.length,
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                      itemBuilder: (context, index) => VoucherCard(
                        discountCode: cubit
                            .activeVoucherModel!.data![index].code
                            .toString(),
                        endAt: cubit.activeVoucherModel!.data![index].endAt
                            .toString(),
                        startAt: cubit.activeVoucherModel!.data![index].startAt
                            .toString(),
                        percentage:
                            cubit.activeVoucherModel!.data![index].discount!,
                      ),
                    ),
        );
      },
    );
  }
}
