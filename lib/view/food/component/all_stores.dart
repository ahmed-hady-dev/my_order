import 'package:flutter/material.dart';
import '../../../core/router/router.dart';
import '../../home/controller/home_cubit.dart';
import '../../store/store_view.dart';
import '../../../widgets/loading_dialog.dart';

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
                    StoreView(storeModelData: storeModel!.data!),
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
