import 'package:flutter/material.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/home/controller/home_cubit.dart';
import 'package:my_order/view/store/store_view.dart';
import 'package:my_order/widgets/loading_dialog.dart';

import 'store_card.dart';

class AllStores extends StatelessWidget {
  final HomeCubit cubit;
  const AllStores({Key? key, required this.cubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stores = cubit.storeOfCategoryModel?.data;
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 20.0),
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: stores!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              loadingDialog(context);
              cubit.getStoreById(storeId: stores[index]!.id.toString()).then(
                (storeModel) {
                  MagicRouter.pop();
                  MagicRouter.navigateTo(
                    StoreView(
                      name: storeModel!.data!.name.toString(),
                      image: storeModel.data!.image.toString(),
                      rate: double.tryParse(storeModel.data!.rate!)!,
                      description: storeModel.data!.description.toString(),
                      openAt: storeModel.data!.openAt.toString(),
                      closeAt: storeModel.data!.closeAt.toString(),
                      deliveryFees: storeModel.data!.deliveryFees!,
                    ),
                  );
                },
              );
            },
            child: StoreCard(
              image: stores[index]!.image.toString(),
              name: stores[index]!.name.toString(),
              description: stores[index]!.description.toString(),
              rate: double.parse(stores[index]!.rate!),
              closeAt: stores[index]!.closeAt.toString(),
              openAt: stores[index]!.openAt.toString(),
            ),
          );
        });
  }
}
