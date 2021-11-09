import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/voucher_cubit.dart';
import '../../../widgets/loading_widget.dart';
import '../widgets/voucher_card.dart';
import 'no_voucher_widget.dart';

class ExpiredTabView extends StatelessWidget {
  const ExpiredTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoucherCubit, VoucherState>(
      builder: (context, state) {
        final cubit = VoucherCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: cubit.expiredVoucherModel == null
              ? const Center(child: LoadingWidget())
              : cubit.expiredVoucherModel!.data!.isEmpty
                  ? const NoVoucherWidget()
                  : ListView.separated(
                      itemCount: cubit.expiredVoucherModel!.data!.length,
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                      itemBuilder: (context, index) => VoucherCard(
                        discountCode: cubit
                            .expiredVoucherModel!.data![index].code
                            .toString(),
                        endAt: cubit.expiredVoucherModel!.data![index].endAt
                            .toString(),
                        startAt: cubit.expiredVoucherModel!.data![index].startAt
                            .toString(),
                        percentage:
                            cubit.expiredVoucherModel!.data![index].discount!,
                      ),
                    ),
        );
      },
    );
  }
}
