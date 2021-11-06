// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';
import '../../../widgets/description_text.dart';
import '../../../widgets/restaurant_name.dart';

class FoodCategoryCard extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final VoidCallback onTap;

  const FoodCategoryCard(
      {Key? key,
      required this.name,
      required this.image,
      required this.description,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 84.0,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.redColor, width: 1.0),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 84.0,
                width: 120.0,
                margin: context.locale == const Locale('en', 'US')
                    ? const EdgeInsets.only(right: 6.0)
                    : const EdgeInsets.only(left: 6.0),
                decoration: BoxDecoration(
                  borderRadius: context.locale == const Locale('en', 'US')
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0))
                      : const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                  image: DecorationImage(
                      image: NetworkImage(image), fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RestaurantName(name: name),
                        DescriptionText(description: description),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
