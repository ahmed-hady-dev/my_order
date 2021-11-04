part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final SearchModel searchModel;

  SearchSuccessState({required this.searchModel});
}

class SearchErrorState extends SearchState {}
//===============================================================

class GetStoreLoading extends SearchState {}

class GetStoreSuccess extends SearchState {
  final StoreModel storeModel;

  GetStoreSuccess({required this.storeModel});
}

class GetStoreError extends SearchState {}
//===============================================================
