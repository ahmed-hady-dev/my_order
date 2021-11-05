// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/food/component/store_card.dart';
import 'package:my_order/view/store/store_view.dart';
import 'package:my_order/widgets/indicator_widget.dart';
import 'package:my_order/widgets/loading_dialog.dart';
import 'package:my_order/widgets/no_result_widget.dart';

import 'component/search_appbar_title.dart';
import 'controller/search_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => SearchCubit(),
        child: BlocConsumer<SearchCubit, SearchState>(
          listener: (context, state) {
            if (state is SearchErrorState) {
              Fluttertoast.showToast(msg: 'change_password.some_error');
            }
          },
          builder: (context, state) {
            final cubit = SearchCubit.get(context);
            return Scaffold(
                body: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: BackButton(),
                    ),
                    Form(
                        key: cubit.formKey,
                        child: SearchAppBarTitle(
                          controller: cubit.searchController,
                          onFieldSubmitted: (value) {
                            if (cubit.formKey.currentState!.validate()) {
                              cubit.searchStore(
                                  query: cubit.searchController.text);
                            }
                          },
                        )),
                  ],
                ),
                state is SearchLoadingState
                    ? const Expanded(child: IndicatorWidget())
                    : cubit.searchModel != null
                        ? cubit.searchModel!.data!.isEmpty
                            ? NoResultsWidget(text: "search.no_results".tr())
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: cubit.searchModel!.data!.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      debugPrint(cubit
                                          .searchModel!.data![index]!.id
                                          .toString());
                                      loadingDialog(context);
                                      cubit
                                          .getStore(
                                              storeId: cubit
                                                  .searchModel!.data![index]!.id
                                                  .toString())
                                          .then((storeModel) {
                                        MagicRouter.pop();
                                        MagicRouter.navigateTo(
                                          StoreView(
                                            storeId: storeModel!.data!.id!,
                                            name: storeModel.data!.name
                                                .toString(),
                                            image: storeModel.data!.image
                                                .toString(),
                                            rate: double.tryParse(
                                                storeModel.data!.rate!)!,
                                            description: storeModel
                                                .data!.description
                                                .toString(),
                                            openAt: storeModel.data!.openAt
                                                .toString(),
                                            closeAt: storeModel.data!.closeAt
                                                .toString(),
                                            deliveryFees:
                                                storeModel.data!.deliveryFees!,
                                          ),
                                        );
                                      });
                                    },
                                    child: StoreCard(
                                        vertical: 4,
                                        image: cubit.searchModel!.data![index]!.image
                                            .toString(),
                                        name: cubit.searchModel!.data![index]!.name
                                            .toString(),
                                        description: cubit.searchModel!
                                            .data![index]!.description
                                            .toString(),
                                        rate: double.tryParse(cubit
                                            .searchModel!.data![index]!.rate
                                            .toString())!,
                                        openAt: cubit
                                            .searchModel!.data![index]!.openAt
                                            .toString(),
                                        closeAt: cubit
                                            .searchModel!.data![index]!.closeAt
                                            .toString()),
                                  );
                                },
                              )
                        : const StartSearchWidget(),
              ],
            ));
          },
        ),
      ),
    );
  }
}

class StartSearchWidget extends StatelessWidget {
  const StartSearchWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_rounded, size: 52.0),
          const SizedBox(height: 8.0),
          Text(
            "search.start_search".tr(),
            style: Theme.of(context).textTheme.headline5,
          )
        ],
      ),
    );
  }
}
