part of 'store_cubit.dart';

@immutable
abstract class StoreState {}

class RestaurantInitial extends StoreState {}

class RestaurantLoading extends StoreState {}

//===============================================================
class GetStoreReviewLoading extends StoreState {}

class GetStoreReviewSuccess extends StoreState {
  final StoreReviewModel storeReviewModel;

  GetStoreReviewSuccess({required this.storeReviewModel});
}

class GetStoreReviewError extends StoreState {}

//===============================================================
class GetStoreOfferLoading extends StoreState {}

class GetStoreOfferSuccess extends StoreState {
  final StoreOfferModel storeOfferModel;

  GetStoreOfferSuccess({required this.storeOfferModel});
}

class GetStoreOfferError extends StoreState {}
