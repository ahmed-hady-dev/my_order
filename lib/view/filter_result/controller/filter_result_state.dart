part of 'filter_result_cubit.dart';

@immutable
abstract class FilterResultState {}

class FilterResultInitial extends FilterResultState {}

class ChangeSelectedFilterButton extends FilterResultState {}
