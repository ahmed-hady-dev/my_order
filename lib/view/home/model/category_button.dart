import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryButton {
  final String categoryName;
  final IconData categoryIcon;
  CategoryButton({required this.categoryName, required this.categoryIcon});
}

List<CategoryButton> categoryButtonModel = [
  CategoryButton(
      categoryName: 'Food', categoryIcon: FontAwesomeIcons.hamburger),
  CategoryButton(
      categoryName: 'Groceries', categoryIcon: FontAwesomeIcons.shoppingBag),
  CategoryButton(
      categoryName: 'Sweet', categoryIcon: FontAwesomeIcons.birthdayCake),
  CategoryButton(
      categoryName: 'Drinks', categoryIcon: FontAwesomeIcons.wineGlassAlt),
];
