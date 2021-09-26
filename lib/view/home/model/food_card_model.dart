class FoodCardModel {
  final String name;
  final String image;
  final double deliveryPrice;
  final String time;
  final double stars;
  final String distance;
  final String status;

  FoodCardModel({
    required this.name,
    required this.image,
    required this.deliveryPrice,
    required this.time,
    required this.stars,
    required this.distance,
    required this.status,
  });
}

List<FoodCardModel> foodCardModel = [
  FoodCardModel(
    name: 'Ranch Effect Sandwich',
    image: 'assets/images/food_item.jpg',
    deliveryPrice: 15.99,
    time: 'Within 24 mins',
    stars: 3,
    distance: '1 km',
    status: 'online',
  ),
  FoodCardModel(
      name: 'Ranch Effect Sandwich',
      image: 'assets/images/food_item.jpg',
      deliveryPrice: 15.99,
      time: 'Within 24 mins',
      distance: '1 km',
      status: 'online',
      stars: 3),
  FoodCardModel(
      name: 'Ranch Effect Sandwich',
      image: 'assets/images/food_item.jpg',
      deliveryPrice: 15.99,
      time: 'Within 24 mins',
      distance: '1 km',
      status: 'online',
      stars: 3),
  FoodCardModel(
      name: 'Ranch Effect Sandwich',
      image: 'assets/images/food_item.jpg',
      deliveryPrice: 15.99,
      time: 'Within 24 mins',
      distance: '1 km',
      status: 'online',
      stars: 3),
];
