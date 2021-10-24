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

// class ChangeSelectedFilterButton extends SearchState {}
//
// class FilterSearchTermsState extends SearchState {}
//
// class AddSearchTermState extends SearchState {}
//
// class DeleteSearchTermState extends SearchState {}
//
// class PutSearchTermFirstState extends SearchState {}
