// ignore_for_file: implementation_imports

import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/dioHelper/dio_helper.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/store/model/items_model.dart';
import 'package:my_order/view/store/model/store_offer_model.dart';
import 'package:my_order/view/store/model/store_review_model.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(RestaurantInitial());
  static StoreCubit get(context) => BlocProvider.of(context);

//===============================================================
  StoreItemsModel? storeItemsModel;
  StoreReviewModel? storeReviewModel;
  StoreOfferModel? storeOfferModel;
//===============================================================
  Future<void> getItems({required int storeId}) async {
    emit(RestaurantLoading());
    final response = await DioHelper.getDataByToken(
        url: "/client/itemCategories/store/$storeId");
    storeItemsModel = StoreItemsModel.fromJson(response.data);
    emit(RestaurantInitial());
  }

  //===============================================================

  Future<void> addReview(int storeId, double rate, String comment) async {
    final body = {'rate': rate, 'store_id': storeId, 'comment': comment};
    await DioHelper.postData(
        url: '/client/reviews', data: FormData.fromMap(body));
    getReviewByStoreId(storeId: storeId);
  }

//===============================================================
  Future<void> getReviewByStoreId({required int storeId}) async {
    emit(GetStoreReviewLoading());
    //TODO: change the getDataByToken to getData here
    final response = await DioHelper.getDataByToken(
      url: storeReview + storeId.toString(),
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    try {
      storeReviewModel = StoreReviewModel.fromJson(response.data);
      emit(GetStoreReviewSuccess(storeReviewModel: storeReviewModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetStoreReviewError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetStoreReviewError());
    }
  }

//===============================================================
  Future<void> getStoreOfferByStoreId({required int storeId}) async {
    emit(GetStoreOfferLoading());
    final response = await DioHelper.getData(
      url: offerForStore + storeId.toString(),
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    try {
      storeOfferModel = StoreOfferModel.fromJson(response.data);
      emit(GetStoreOfferSuccess(storeOfferModel: storeOfferModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetStoreOfferError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetStoreOfferError());
    }
  }
}
