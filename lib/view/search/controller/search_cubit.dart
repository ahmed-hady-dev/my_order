// ignore_for_file: implementation_imports

import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/food/model/store_model.dart';
import '../../../constants/constants.dart';
import '../../../core/dioHelper/dio_helper.dart';
import '../model/search_model.dart';
import 'package:intl/intl.dart' as intl;

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  static SearchCubit get(context) => BlocProvider.of(context);
  //===============================================================
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SearchModel? searchModel;
  StoreModel? storeModel;
  //===============================================================
  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text);
  }

  Future<void> searchStore({required String query}) async {
    emit(SearchLoadingState());

    final response = !isRTL(query)
        ? await DioHelper.getData(
            url: search, query: {'store': query.toLowerCase(), 'lang': 'en'})
        : await DioHelper.getData(
            url: search, query: {'store': query, 'lang': 'ar'});
    try {
      searchModel = SearchModel.fromJson(response.data);
      emit(SearchSuccessState(searchModel: searchModel!));
      debugPrint(isRTL(query).toString());
    } on DioError catch (e) {
      debugPrint(e.error.toString());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(SearchErrorState());
    }
  }

//===============================================================
  Future<StoreModel?> getStore({required String storeId}) async {
    emit(GetStoreLoading());
    final response = await DioHelper.getData(
      url: store + storeId,
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    try {
      storeModel = StoreModel.fromJson(response.data);
      emit(GetStoreSuccess(storeModel: storeModel!));
      return storeModel!;
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetStoreError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetStoreError());
    }
  }
//===============================================================

}
