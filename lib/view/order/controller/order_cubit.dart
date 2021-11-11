// ignore_for_file: implementation_imports

import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_order/core/router/router.dart';
import '../../../core/dioHelper/dio_helper.dart';
import '../model/item_details.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit() : super(OrderInitial());

  static OrderCubit get(context) => BlocProvider.of(context);
  //===============================================================
  int orderCount = 1;
  double totalPrice = 0.0;
  int? sizeId, extraId;
  ItemDetailsModel? itemDetailsModel;
  //===============================================================

  Future<void> getDetails({required int itemId}) async {
    emit(GetDetailsLoading());
    final response = await DioHelper.getDataByToken(
      url: "/client/items/$itemId",
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    try {
      itemDetailsModel = ItemDetailsModel.fromJson(response.data);
      emit(GetDetailsSuccess());
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetDetailsError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetDetailsError());
    }
  }

  Future<void> addToCart({
    required int storeId,
    required int itemId,
  }) async {
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
