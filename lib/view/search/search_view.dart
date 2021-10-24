// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order/view/food/component/store_card.dart';
import 'package:my_order/widgets/indicator_widget.dart';

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
                                  query: cubit.searchController.text
                                      .toLowerCase());
                            }
                          },
                        )),
                  ],
                ),
                state is SearchLoadingState
                    ? const Expanded(child: IndicatorWidget())
                    : state is SearchSuccessState
                        ? cubit.searchModel!.data!.isEmpty
                            ? Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.error_outline_rounded,
                                        size: 52.0),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      "search.no_results".tr(),
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    )
                                  ],
                                ),
                              )
                            : Expanded(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: cubit.searchModel!.data!.length,
                                  itemBuilder: (context, index) {
                                    return StoreCard(
                                        vertical: 4,
                                        image: cubit
                                            .searchModel!.data![index]!.image
                                            .toString(),
                                        name: cubit
                                            .searchModel!.data![index]!.name
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
                                            .toString());
                                  },
                                ),
                              )
                        : Expanded(
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
                          ),
              ],
            ));
          },
        ),
      ),
    );
  }
}

// class SearchResultsListView extends StatelessWidget {
//   final String? searchTerm;
//
//   const SearchResultsListView({
//     Key? key,
//     required this.searchTerm,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     if (searchTerm == null) {
//       return Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(
//               Icons.search_rounded,
//               size: 64,
//             ),
//             TextButton(
//                 onPressed: () async {
//                   var ttt = await SearchCubit.get(context).searchHistory;
//                   // await CacheHelper.readSomeThing(key: 'searchHistory');
//                   debugPrint("$ttt");
//                 },
//                 child: Text('text', style: const TextStyle())),
//             Text(
//               "search.start_search".tr(),
//               style: Theme.of(context).textTheme.headline5,
//             )
//           ],
//         ),
//       );
//     }
//
//     final fsb = FloatingSearchBar.of(context)!.widget;
//
//     return ListView(
//       padding: EdgeInsets.only(top: fsb.height + 12.0),
//       children: List.generate(
//         5,
//         (index) => Column(
//           children: [
//             TextButton(
//                 onPressed: () async {
//                   var ttt = await SearchCubit.get(context).searchHistory;
//                   // await CacheHelper.readSomeThing(key: 'searchHistory');
//                   debugPrint("$ttt");
//                 },
//                 child: Text('text', style: const TextStyle())),
//             ListTile(
//               title: Text('$searchTerm search result'),
//               subtitle: Text(index.toString()),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// return Scaffold(
//     body: FloatingSearchBar(
//   elevation: 0.0,
//   borderRadius: BorderRadius.circular(8.0),
//   border: const BorderSide(color: AppColors.redColor, width: 1.2),
//   controller: cubit.floatingSearchBarController,
//   body: SearchResultsListView(searchTerm: cubit.selectedTerm),
//   transition: CircularFloatingSearchBarTransition(),
//   physics: const BouncingScrollPhysics(),
//   title: Text(cubit.selectedTerm ?? "search.search_bar".tr(),
//       style: Theme.of(context).textTheme.subtitle1),
//   hint: "search.search_bar".tr(),
//   actions: [FloatingSearchBarAction.searchToClear()],
//   onQueryChanged: (query) {
//     cubit.filteredSearchHistory =
//         cubit.filterSearchTerms(filter: query) as List<String>;
//   },
//   onSubmitted: (query) async {
//     cubit.addSearchTerm(query);
//     cubit.selectedTerm = query;
//     cubit.floatingSearchBarController.close();
//   },
//   builder: (context, transition) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(8),
//       child: Material(
//         color: Colors.white,
//         elevation: 0,
//         child: Builder(
//           builder: (context) {
//             if (cubit.filteredSearchHistory.isEmpty &&
//                 cubit.floatingSearchBarController.query.isEmpty) {
//               return Container(
//                 height: 56,
//                 width: double.infinity,
//                 alignment: Alignment.center,
//                 child: Text(
//                   "search.start_search".tr(),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   style: Theme.of(context).textTheme.caption,
//                 ),
//               );
//             } else if (cubit.filteredSearchHistory.isEmpty) {
//               return ListTile(
//                 title:
//                     Text(cubit.floatingSearchBarController.query),
//                 leading: const Icon(Icons.search_rounded),
//                 onTap: () {
//                   cubit.addSearchTerm(
//                       cubit.floatingSearchBarController.query);
//                   cubit.selectedTerm =
//                       cubit.floatingSearchBarController.query;
//                   cubit.floatingSearchBarController.close();
//                 },
//               );
//             } else {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: cubit.filteredSearchHistory
//                     .map(
//                       (term) => ListTile(
//                         title: Text(
//                           term,
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         leading: const Icon(Icons.history),
//                         trailing: IconButton(
//                           icon: const Icon(Icons.clear),
//                           onPressed: () {
//                             cubit.deleteSearchTerm(term);
//                           },
//                         ),
//                         onTap: () {
//                           cubit.putSearchTermFirst(term);
//                           cubit.selectedTerm = term;
//                           cubit.floatingSearchBarController.close();
//                         },
//                       ),
//                     )
//                     .toList(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   },
// ));

//===============================================================

//===============================================================
//filter buttons
// body: ListView(
//   shrinkWrap: true,
//   children: [
//     BoldHeader(text: "search.popular_search".tr()),
//     Wrap(
//       children: searchFilterButtonList
//           .map(
//             (item) => Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: 8.0),
//               child: OutlinedButton(
//                 style: OutlinedButton.styleFrom(
//                   primary: Colors.white,
//                   side: const BorderSide(
//                       width: 0.0, color: Colors.transparent),
//                   backgroundColor: item.isSelected
//                       ? AppColors.redColor
//                       : AppColors.redColor.withOpacity(0.5),
//                 ),
//                 onPressed: () {
//                   item.isSelected = !item.isSelected;
//                   cubit.changeSelectedFilterButton();
//                 },
//                 child: Text(item.text),
//               ),
//             ),
//           )
//           .toList(),
//     ),
//   ],
// ),
