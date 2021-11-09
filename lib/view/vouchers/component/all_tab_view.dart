import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'no_voucher_widget.dart';
import '../controller/voucher_cubit.dart';
import '../widgets/voucher_card.dart';
import '../../../widgets/loading_widget.dart';

class AllTabView extends StatelessWidget {
  const AllTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoucherCubit, VoucherState>(
      builder: (context, state) {
        final cubit = VoucherCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: cubit.allVoucherModel == null
              ? const Center(child: LoadingWidget())
              : cubit.allVoucherModel!.data!.isEmpty
                  ? const NoVoucherWidget()
                  : ListView.separated(
                      itemCount: cubit.allVoucherModel!.data!.length,
                      separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(),
                      ),
                      itemBuilder: (context, index) => VoucherCard(
                        discountCode:
                            cubit.allVoucherModel!.data![index].code.toString(),
                        endAt: cubit.allVoucherModel!.data![index].endAt
                            .toString(),
                        startAt: cubit.allVoucherModel!.data![index].startAt
                            .toString(),
                        percentage:
                            cubit.allVoucherModel!.data![index].discount!,
                      ),
                    ),
        );
      },
    );
  }
}
