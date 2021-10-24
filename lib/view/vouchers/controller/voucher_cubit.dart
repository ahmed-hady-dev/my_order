import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/dioHelper/dio_helper.dart';
import 'package:my_order/view/vouchers/model/voucher_model.dart';

part 'voucher_state.dart';

class VoucherCubit extends Cubit<VoucherState> {
  VoucherCubit() : super(VoucherInitial());
  static VoucherCubit get(context) => BlocProvider.of(context);
//===============================================================
  VoucherModel? allVoucherModel;
  VoucherModel? activeVoucherModel;
  VoucherModel? usedVoucherModel;
  VoucherModel? expiredVoucherModel;
//===============================================================
  Future<void> getAllVouchers() async {
    emit(AllVoucherLoading());
    final response = await DioHelper.getData(url: allVoucher);
    try {
      allVoucherModel = VoucherModel.fromJson(response.data);
      emit(AllVoucherSuccess(voucherModel: allVoucherModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(AllVoucherError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(AllVoucherError());
    }
  }

  //===============================================================
  Future<void> getActiveVouchers() async {
    emit(ActiveVoucherLoading());
    final response = await DioHelper.getData(url: activeVoucher);
    try {
      activeVoucherModel = VoucherModel.fromJson(response.data);
      emit(ActiveVoucherSuccess(voucherModel: activeVoucherModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(ActiveVoucherError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(ActiveVoucherError());
    }
  }

  //===============================================================
  Future<void> getUsedVouchers() async {
    emit(UsedVoucherLoading());
    final response = await DioHelper.getData(url: usedVoucher);
    try {
      usedVoucherModel = VoucherModel.fromJson(response.data);
      emit(ActiveVoucherSuccess(voucherModel: usedVoucherModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(UsedVoucherError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(UsedVoucherError());
    }
  }

  //===============================================================
  Future<void> getExpiredVouchers() async {
    emit(ExpiredVoucherLoading());
    final response = await DioHelper.getData(url: expiredVoucher);
    try {
      expiredVoucherModel = VoucherModel.fromJson(response.data);
      emit(ActiveVoucherSuccess(voucherModel: expiredVoucherModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(ExpiredVoucherError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(ExpiredVoucherError());
    }
  }
}
