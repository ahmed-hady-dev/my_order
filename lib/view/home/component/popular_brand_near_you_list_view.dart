import 'package:flutter/material.dart';
import '../../../core/router/router.dart';
import '../controller/home_cubit.dart';
import '../../store/store_view.dart';
import '../../../widgets/loading_dialog.dart';

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
                    StoreView(storeModelData: storeModel!.data!),
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
                      color: Colors.grey,
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
