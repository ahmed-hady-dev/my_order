import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../core/dioHelper/dio_helper.dart';
import '../model/item_details.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({required this.storeId, required this.itemId})
      : super(OrderInitial());

  final int itemId;
  final int storeId;

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
    final response =
        await DioHelper.getDataByToken(url: "/client/items/$itemId");
    itemDetailsModel = ItemDetailsModel.fromJson(response.data);
    emit(OrderInitial());
  }

  Future<void> addToCart() async {
    if (sizeId == null) return;
    emit(OrderButtonLoading());
    final body = {
      'order[0][item_id]': itemId,
      'order[0][quantity]': orderCount,
      if (extraId != null) 'order[0][extras][]': extraId,
      'store_id': storeId,
      'order[0][item_size_id]': sizeId
    };
    final response = await DioHelper.postData(
        url: "/client/orders/addToCart", data: FormData.fromMap(body));
    debugPrint(response.data);
    Fluttertoast.showToast(msg: response.data['message']);
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
    if (isSize) {
      sizeId = id;
    } else {
      extraId = id;
    }
    emit(OrderInitial());
  }
}
