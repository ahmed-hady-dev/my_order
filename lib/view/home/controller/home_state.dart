part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeCarouselIndex extends HomeState {}
//===============================================================

class GetStoreCategoriesLoading extends HomeState {}

class GetStoreCategoriesSuccess extends HomeState {
  final StoreCategoriesModel storeCategoriesModel;

  GetStoreCategoriesSuccess({required this.storeCategoriesModel});
}

class GetStoreCategoriesError extends HomeState {}
//===============================================================

class GetStoreSubCategoriesLoading extends HomeState {}

class GetStoreSubCategoriesSuccess extends HomeState {
  final StoreSubCategoriesModel storeSubCategoriesModel;

  GetStoreSubCategoriesSuccess({required this.storeSubCategoriesModel});
}

class GetStoreSubCategoriesError extends HomeState {}
