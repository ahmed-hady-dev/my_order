// import 'package:flutter/material.dart';
// import '../../../constants/app_colors.dart';
//
// class ValidDateRow extends StatelessWidget {
//   final String startAt;
//   final String endAt;
//   final double horizontalPadding;
//   final double verticalPadding;
//   const ValidDateRow({
//     Key? key,
//     this.horizontalPadding = 4.0,
//     this.verticalPadding = 4.0,
//     required this.startAt,
//     required this.endAt,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//           vertical: verticalPadding, horizontal: horizontalPadding),
//       child: Row(
//         children: [
//           const Icon(Icons.local_offer_rounded,
//               color: AppColors.redColor, size: 12.0),
//           const SizedBox(width: 2.0),
//           Text(
//             'validDate',
//             style: const TextStyle(fontSize: 12.0, color: AppColors.redColor),
//           ),
//         ],
//       ),
//     );
//   }
// }
