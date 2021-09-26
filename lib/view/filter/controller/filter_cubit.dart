import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit() : super(FilterInitial());
  static FilterCubit get(context) => BlocProvider.of(context);
  //===============================================================
  changeSelectedFilterButton() {
    emit(ChangeSelectedFilterButton());
  }
}
