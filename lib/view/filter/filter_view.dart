// // ignore_for_file: implementation_imports
//
// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_order/widgets/bold_header.dart';
//
// import 'component/apply_button.dart';
// import 'component/deals_and_offers_filters.dart';
// import 'component/popular_filters.dart';
// import 'component/sort_by_filters.dart';
// import 'controller/filter_cubit.dart';
//
// class FilterView extends StatelessWidget {
//   const FilterView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BlocProvider(
//         create: (context) => FilterCubit(),
//         child: BlocBuilder<FilterCubit, FilterState>(
//           builder: (context, state) {
//             final cubit = FilterCubit.get(context);
//             return Scaffold(
//               appBar: AppBar(
//                 title: Text("filter.appBar_title".tr()),
//                 actions: [
//                   TextButton(
//                     onPressed: () {
//                     },
//                     child: Text("filter.clear_all".tr()),
//                   )
//                 ],
//               ),
//               body: ListView(
//                 primary: true,
//                 shrinkWrap: true,
//                 children: [
//                   BoldHeader(text: "filter.popular_filters".tr()),
//                   PopularFilters(cubit: cubit),
//                   BoldHeader(text: "filter.deals_and_offers".tr()),
//                   DealsAndOffersFilters(cubit: cubit),
//                   BoldHeader(text: "filter.sort_by".tr()),
//                   SortByFilters(cubit: cubit),
//                   const ApplyButton()
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
