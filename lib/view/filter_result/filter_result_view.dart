// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_order/view/store/store_view.dart';
// import '../../constants/app_colors.dart';
// import '../../core/router/router.dart';
// import '../../widgets/food_item_with_border.dart';
// import '../store/store_view.dart';
// import '../search/model/filter_button_model.dart';
// import '../../widgets/bold_header.dart';
//
// import 'component/filter_result_app_bar_title.dart';
// import 'controller/filter_result_cubit.dart';
// import 'model/restaurant_result_model.dart';
//
// class FilterResultView extends StatelessWidget {
//   const FilterResultView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: BlocProvider(
//         create: (context) => FilterResultCubit(),
//         child: BlocBuilder<FilterResultCubit, FilterResultState>(
//           builder: (context, state) {
//             final cubit = FilterResultCubit.get(context);
//             return Scaffold(
//               appBar: AppBar(
//                 titleSpacing: 0.0,
//                 leadingWidth: 48.0,
//                 centerTitle: false,
//                 title:
//                     FilterResultAppBarTitle(controller: cubit.searchController),
//               ),
//               body: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Wrap(
//                     children: filterResultButtonList
//                         .map(
//                           (item) => Padding(
//                             padding:
//                                 const EdgeInsets.symmetric(horizontal: 8.0),
//                             child: OutlinedButton(
//                               style: OutlinedButton.styleFrom(
//                                 primary: Colors.white,
//                                 side: const BorderSide(
//                                     width: 0.0, color: Colors.transparent),
//                                 backgroundColor: item.isSelected
//                                     ? AppColors.redColor
//                                     : AppColors.redColor.withOpacity(0.5),
//                               ),
//                               onPressed: () {
//                                 item.isSelected = !item.isSelected;
//                                 cubit.changeSelectedFilterButton();
//                               },
//                               child: Text(item.text),
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                   const SizedBox(height: 32.0),
//                   const BoldHeader(text: 'Popular Koshary restaurants'),
//                   Expanded(
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: restaurantResultList.length,
//                       itemBuilder: (context, index) => FoodItemWithBorder(
//                         image: restaurantResultList[index].image,
//                         name: restaurantResultList[index].name,
//                         price: restaurantResultList[index].price,
//                         status: restaurantResultList[index].status,
//                         stars: restaurantResultList[index].stars,
//                         time: restaurantResultList[index].time,
//                         onTap: () => MagicRouter.navigateTo(
//                           StoreView(
//                             image: restaurantResultList[index].image,
//                             name: restaurantResultList[index].name,
//                             // price: restaurantResultList[index].price,
//                             status: restaurantResultList[index].status,
//                             rate: restaurantResultList[index].stars,
//                             time: restaurantResultList[index].time,
//                             distance: restaurantResultList[index].distance,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
