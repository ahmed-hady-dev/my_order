class OffersModel {
  final String name;
  final double price;
  final double discountPercentage;
  final String validDate;
  final String image;

  OffersModel({
    required this.name,
    required this.image,
    required this.price,
    required this.validDate,
    required this.discountPercentage,
  });
}

List<OffersModel> offersList = [
  OffersModel(
    name: 'Super Koshary',
    image: 'assets/images/food_banner.jpg',
    price: 15.0,
    validDate: 'Will end in 2 days',
    discountPercentage: 10.0,
  ),
  OffersModel(
    name: 'Super Koshary',
    image: 'assets/images/food_banner.jpg',
    price: 15.0,
    validDate: 'Will end in 2 days',
    discountPercentage: 11.0,
  ),
  OffersModel(
    name: 'Super Koshary',
    image: 'assets/images/food_banner.jpg',
    price: 15.0,
    validDate: 'Will end in 2 days',
    discountPercentage: 22.0,
  ),
  OffersModel(
    name: 'Super Koshary',
    image: 'assets/images/food_banner.jpg',
    price: 15.0,
    validDate: 'Will end in 2 days',
    discountPercentage: 12.0,
  ),
  OffersModel(
    name: 'Super Koshary',
    image: 'assets/images/food_banner.jpg',
    price: 15.0,
    validDate: 'Will end in 2 days',
    discountPercentage: 14.0,
  ),
];
