import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/dioHelper/dio_helper.dart';
import 'package:my_order/view/order/model/item_details.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.itemId) : super(OrderInitial());

  final int itemId;

  static OrderCubit get(context) => BlocProvider.of(context);
  //===============================================================
  int orderCount = 1;
  double totalPrice = 0.0;
  int? sizeId, extraId;
  String? notes;
  ItemDetailsModel? itemDetailsModel;
  //===============================================================

  Future<void> getDetails() async {
    emit(OrderLoading());
    final response = await DioHelper.getDataByToken(url: "/client/items/$itemId");
    itemDetailsModel = ItemDetailsModel.fromJson(response.data);
    emit(OrderInitial());
  }

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
  void valueChangedHandler(bool isSize, int id) {
    if(isSize){
      sizeId = id;
    }else{
      extraId = id;
    }
    emit(OrderInitial());
  }
}
