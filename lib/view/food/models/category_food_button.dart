import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryFoodButton {
  final String categoryName;
  final IconData categoryIcon;

  CategoryFoodButton({
    required this.categoryName,
    required this.categoryIcon,
  });
}

List<CategoryFoodButton> categoryFoodButtonModel = [
  CategoryFoodButton(
      categoryName: 'Crepe', categoryIcon: FontAwesomeIcons.cheese),
  CategoryFoodButton(
      categoryName: 'Pizza', categoryIcon: FontAwesomeIcons.pizzaSlice),
  CategoryFoodButton(
      categoryName: 'Sweet', categoryIcon: FontAwesomeIcons.cookie),
  CategoryFoodButton(
      categoryName: 'Sandwich', categoryIcon: FontAwesomeIcons.hamburger),
];
