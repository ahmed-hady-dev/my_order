import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());
  static OrderCubit get(context) => BlocProvider.of(context);
  //===============================================================
  int orderCount = 1;
  double totalPrice = 0.0;
  String? groupValue;
  //===============================================================
  void increaseOrderCount() {
    orderCount++;
    emit(OrderCounterChange());
  }

  void decreaseOrderCount() {
    orderCount--;
    emit(OrderCounterChange());
  }

//===============================================================
  ValueChanged<String?> valueChangedHandler() {
    return (value) => groupValue = value!;
  }
}
