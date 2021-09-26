import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  static OrdersCubit get(context) => BlocProvider.of(context);
  late int isSelected = 0;
  late bool labelSelect = true;

  int get getCurrentItem => isSelected;

  //===============================================================
  void itemSelection(int value) async {
    isSelected = value;
    if (isSelected == 0) {
      labelSelect = false;
    } else {
      labelSelect = true;
    }
    emit(SelectedItem());
  }
}
