part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class ChangeCarouselIndex extends HomeState {}
//===============================================================

class GetSlidesLoading extends HomeState {}

class GetSlidesSuccess extends HomeState {
  final SlidesModel slidesModel;

  GetSlidesSuccess({required this.slidesModel});
}

class GetSlidesError extends HomeState {}
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
class GetPopularFoodLoading extends HomeState {}

class GetPopularFoodSuccess extends HomeState {
  final PopularFoodModel popularFoodModel;

  GetPopularFoodSuccess({required this.popularFoodModel});
}

class GetPopularFoodError extends HomeState {}

//===============================================================
class GetSpecialOffersLoading extends HomeState {}

class GetSpecialOffersSuccess extends HomeState {
  final SpecialOffersModel specialOffersModel;

  GetSpecialOffersSuccess({required this.specialOffersModel});
}

class GetSpecialOffersError extends HomeState {}

//===============================================================
class GetItemLoading extends HomeState {}

class GetItemSuccess extends HomeState {
  final ItemModel itemModel;

  GetItemSuccess({required this.itemModel});
}

class GetItemError extends HomeState {}

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
