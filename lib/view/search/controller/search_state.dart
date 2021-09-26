part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class ChangeSelectedFilterButton extends SearchState {}
