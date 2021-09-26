class FoodCategoryModel {
  final String name;
  final double price;
  final String description;
  final String image;

  FoodCategoryModel({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
  });
}

List<FoodCategoryModel> foodCategoryList = [
  FoodCategoryModel(
    name: 'Koshary',
    price: 15.0,
    description: 'Pasta',
    image: 'assets/images/food_banner.jpg',
  ),
  FoodCategoryModel(
    name: 'Koshary',
    price: 36.0,
    description: 'Pasta',
    image: 'assets/images/food_banner.jpg',
  ),
  FoodCategoryModel(
    name: 'Koshary',
    price: 50.0,
    description: 'Pasta',
    image: 'assets/images/food_banner.jpg',
  ),
  FoodCategoryModel(
    name: 'Koshary',
    price: 12.0,
    description: 'Pasta',
    image: 'assets/images/food_banner.jpg',
  ),
];
