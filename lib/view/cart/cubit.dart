import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../core/dioHelper/dio_helper.dart';
import 'model/cart.dart';
import 'states.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInit());

  static CartCubit of(context) => BlocProvider.of(context);

  CartModel? cartModel;

  Future<void> getDetails() async {
    emit(CartLoading());
    try{
      final response =
      await DioHelper.getDataByToken(url: "/client/orders/displayCart");
      if(response.data['data'] != null){
        cartModel = CartModel.fromJson(response.data);
      }
    }catch(e){}
    emit(CartInit());
  }

  Future<void> updateCart(
      {required int storeId,
      required int quantity,
      required int itemId,
      required int sizeId,
      required int? extraId}) async {
    final body = {
      'order[0][item_id]': itemId,
      'order[0][quantity]': quantity,
      'store_id': storeId,
      'order[0][item_size_id]': sizeId,
      if (extraId != null) 'order[0][extras][]': extraId
    };
    final response = await DioHelper.postData(
        url: "/client/orders/updateCart", data: FormData.fromMap(body));
    // debugPrint(response.data);
    cartModel = CartModel.fromJson(response.data);
    emit(CartInit());
  }

  Future<void> removeCart(
      {required int storeId,
      required int quantity,
      required int itemId,
      required int sizeId,
      required int? extraId}) async {
    final body = {
      'order[item_id]': itemId,
      'store_id': storeId,
      'order[item_size_id]': sizeId,
      if (extraId != null) 'order[extras][]': extraId
    };
    print(body);
    final r = await DioHelper.postData(
        url: "/client/orders/removeFromCart", data: FormData.fromMap(body));
    print(r);
    cartModel!.data!.items!.removeWhere((element) => element.id == itemId);
    emit(CartInit());
  }

  Future<void> clearCart() async {
    if(cartModel == null || cartModel!.data!.items!.isEmpty) return;
    await DioHelper.postData(
        url: "/client/orders/clearCart");
    cartModel!.data!.items!.clear();
    emit(CartInit());
  }

  Future<void> completeOrder()async{
    await DioHelper.postData(
        url: "/client/orders/checkout");
    Fluttertoast.showToast(msg: 'Order Sent Successfully!');
    cartModel!.data!.items!.clear();
    emit(CartInit());
  }
}
