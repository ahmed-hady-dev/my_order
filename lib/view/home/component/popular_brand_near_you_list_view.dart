import 'package:flutter/material.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/home/controller/home_cubit.dart';
import 'package:my_order/view/store/store_view.dart';
import 'package:my_order/widgets/loading_dialog.dart';

class PopularBrandNearYouListView extends StatelessWidget {
  const PopularBrandNearYouListView({Key? key, required this.cubit})
      : super(key: key);
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    final stores = cubit.popularBrandsModel!.data;
    return SizedBox(
      height: 140.0,
      child: ListView.builder(
        shrinkWrap: true,
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: stores!.length,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              loadingDialog(context);
              cubit.getStoreById(storeId: stores[index]!.id.toString()).then(
                (storeModel) {
                  MagicRouter.pop();
                  MagicRouter.navigateTo(
                    StoreView(
                      reviewsNumber: storeModel!.data!.reviewsNumber!,
                      storeId: storeModel.data!.id!,
                      name: storeModel.data!.name.toString(),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: NetworkImage(stores[index]!.image.toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      stores[index]!.name.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 14.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
