import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_order/core/dioHelper/dio_helper.dart';
import 'package:my_order/view/orders/model/orders_model.dart';

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
    final recentResponse = await DioHelper.getDataByToken(url: "/client/orders/recent");
    recentOrders = OrdersModel.fromJson(recentResponse.data);
    final oldResponse = await DioHelper.getDataByToken(url: "/client/orders/old");
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
