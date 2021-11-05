import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class FoodCategoryTabBar extends StatelessWidget {
  final List list;
  const FoodCategoryTabBar({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      labelPadding: EdgeInsets.zero,
      //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      indicatorColor: AppColors.redColor,
      labelColor: Colors.black,
      tabs: list
          .map((item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: AutoSizeText(
                  item.name.toString(),
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),).toList(),
    );
  }
}
