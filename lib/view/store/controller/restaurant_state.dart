part of 'restaurant_cubit.dart';

@immutable
abstract class RestaurantState {}

class RestaurantInitial extends RestaurantState {}

class RestaurantLoading extends RestaurantState {}

//===============================================================
class GetStoreReviewLoading extends RestaurantState {}

class GetStoreReviewSuccess extends RestaurantState {
  final StoreReviewModel storeReviewModel;

  GetStoreReviewSuccess({required this.storeReviewModel});
}

class GetStoreReviewError extends RestaurantState {}
