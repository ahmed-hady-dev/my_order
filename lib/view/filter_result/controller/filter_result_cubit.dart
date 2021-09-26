import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'filter_result_state.dart';

class FilterResultCubit extends Cubit<FilterResultState> {
  FilterResultCubit() : super(FilterResultInitial());
  static FilterResultCubit get(context) => BlocProvider.of(context);
  //===============================================================
  TextEditingController searchController = TextEditingController();
  //===============================================================
  changeSelectedFilterButton() {
    emit(ChangeSelectedFilterButton());
  }
}
