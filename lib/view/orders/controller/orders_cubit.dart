// ignore_for_file: implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_order/core/router/router.dart';
import '../../../core/dioHelper/dio_helper.dart';
import '../model/orders_model.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());
  static OrdersCubit get(context) => BlocProvider.of(context);
  late int isSelected = 12;
  late bool labelSelect = true;

  int get getCurrentItem => isSelected;

  //===============================================================

  OrdersModel? recentOrders, oldOrders;

  Future<void> getOrders() async {
    emit(OrdersLoading());
    final recentResponse = await DioHelper.getDataByToken(
      url: "/client/orders/recent",
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    recentOrders = OrdersModel.fromJson(recentResponse.data);
    final oldResponse = await DioHelper.getDataByToken(
      url: "/client/orders/old",
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    oldOrders = OrdersModel.fromJson(oldResponse.data);
    emit(OrdersInitial());
  }

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
