class RestaurantResultModel {
  final String name;
  final String image;
  final double price;
  final String status;
  final String distance;
  final double stars;
  final String time;

  RestaurantResultModel(
      {required this.name,
      required this.image,
      required this.price,
      required this.status,
      required this.stars,
      required this.distance,
      required this.time});
}

List<RestaurantResultModel> restaurantResultList = [
  RestaurantResultModel(
    name: 'Mama Mia',
    image: 'assets/images/food_banner.jpg',
    price: 15.99,
    time: 'Within 24 mins',
    stars: 3,
    status: 'offline',
    distance: '1 km',
  ),
  RestaurantResultModel(
    name: 'Mama Mia',
    image: 'assets/images/food_banner.jpg',
    price: 15.99,
    time: 'Within 24 mins',
    stars: 3,
    status: 'online',
    distance: '1 km',
  ),
  RestaurantResultModel(
    name: 'Mama Mia',
    image: 'assets/images/food_banner.jpg',
    price: 15.99,
    time: 'Within 24 mins',
    stars: 3,
    status: 'online',
    distance: '1 km',
  ),
  RestaurantResultModel(
    name: 'Mama Mia',
    image: 'assets/images/food_banner.jpg',
    price: 15.99,
    time: 'Within 24 mins',
    stars: 3,
    status: 'online',
    distance: '1 km',
  ),
  RestaurantResultModel(
    name: 'Mama Mia',
    image: 'assets/images/food_banner.jpg',
    price: 15.99,
    time: 'Within 24 mins',
    stars: 3,
    status: 'online',
    distance: '1 km',
  ),
  RestaurantResultModel(
    name: 'Mama Mia',
    image: 'assets/images/food_banner.jpg',
    price: 15.99,
    time: 'Within 24 mins',
    stars: 3,
    status: 'online',
    distance: '1 km',
  ),
];
