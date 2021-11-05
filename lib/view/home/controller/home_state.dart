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
class GetPopularBrandsLoading extends HomeState {}

class GetPopularBrandsSuccess extends HomeState {
  final PopularBrandsModel popularBrandsModel;

  GetPopularBrandsSuccess({required this.popularBrandsModel});
}

class GetPopularBrandsError extends HomeState {}

//===============================================================
class LogoutLoadingState extends HomeState {}

class LogoutErrorState extends HomeState {}

class LogoutSuccessState extends HomeState {}

//===============================================================

class GetStoreOfCategoryLoading extends HomeState {}

class GetStoreOfCategorySuccess extends HomeState {
  final StoreOfCategoryModel storeOfCategoryModel;

  GetStoreOfCategorySuccess({required this.storeOfCategoryModel});
}

class GetStoreOfCategoryError extends HomeState {}

//===============================================================

class GetStoreLoading extends HomeState {}

class GetStoreSuccess extends HomeState {
  final StoreModel storeModel;

  GetStoreSuccess({required this.storeModel});
}

class GetStoreError extends HomeState {}
//===============================================================

class GetStoreSubCategoriesByIdLoading extends HomeState {}

class GetStoreSubCategoriesByIdSuccess extends HomeState {
  final StoreSubCategoriesModel storeSubCategoriesModel;

  GetStoreSubCategoriesByIdSuccess({required this.storeSubCategoriesModel});
}

class GetStoreSubCategoriesByIdError extends HomeState {}
