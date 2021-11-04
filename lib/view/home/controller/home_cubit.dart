// ignore_for_file: implementation_imports

import 'package:dio/dio.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/cacheHelper/cache_helper.dart';
import 'package:my_order/core/dioHelper/dio_helper.dart';
import 'package:my_order/core/router/router.dart';
import 'package:my_order/view/food/model/store_model.dart';
import 'package:my_order/view/food/model/store_model_of_category.dart';
import 'package:my_order/view/home/model/logout_model.dart';
import 'package:my_order/view/home/model/store_categories_model.dart';
import 'package:my_order/view/home/model/store_sub_categories_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
//===============================================================
  StoreCategoriesModel? storeCategoriesModel;
  StoreSubCategoriesModel? storeSubCategoriesModel;
  StoreOfCategoryModel? storeOfCategoryModel;
  StoreModel? storeModel;
  LogoutModel? logoutModel;
  int carouselIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//===============================================================
  changeCarouselIndex({required int index}) {
    carouselIndex = index;
    emit(ChangeCarouselIndex());
  }

  List carouselImage = [
    'assets/images/carousel.png',
    'assets/images/carousel.png',
    'assets/images/carousel.png',
  ];
//===============================================================
  Future<void> getStoreCategories() async {
    emit(GetStoreCategoriesLoading());
    final response = await DioHelper.getData(
      url: storeCategories,
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    try {
      storeCategoriesModel = StoreCategoriesModel.fromJson(response.data);
      emit(GetStoreCategoriesSuccess(
          storeCategoriesModel: storeCategoriesModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetStoreCategoriesError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetStoreCategoriesError());
    }
  }
//===============================================================

  Future<void> getStoreOfCategory({required String categoryId}) async {
    emit(GetStoreOfCategoryLoading());
    final response = await DioHelper.getDataByToken(
      url: storesOfCategory + categoryId,
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    try {
      storeOfCategoryModel = StoreOfCategoryModel.fromJson(response.data);
      emit(GetStoreOfCategorySuccess(
          storeOfCategoryModel: storeOfCategoryModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetStoreOfCategoryError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetStoreOfCategoryError());
    }
  }

//===============================================================

  Future<StoreModel?> getStore({required String storeId}) async {
    emit(GetStoreLoading());
    final response = await DioHelper.getDataByToken(
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
  Future<void> getStoreSubCategoriesById({required String id}) async {
    emit(GetStoreSubCategoriesByIdLoading());
    final response = await DioHelper.getData(
      url: storeSubCategoriesForCategory + id,
      query: {
        'lang': MagicRouter.currentContext!.locale.languageCode == 'en'
            ? 'en'
            : 'ar'
      },
    );
    try {
      storeSubCategoriesModel = StoreSubCategoriesModel.fromJson(response.data);
      emit(GetStoreSubCategoriesByIdSuccess(
          storeSubCategoriesModel: storeSubCategoriesModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetStoreSubCategoriesByIdError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetStoreSubCategoriesByIdError());
    }
  }

//===============================================================
  Future<void> signOut() async {
    emit(LogoutLoadingState());
    final response = await DioHelper.postData(url: logout, data: {});
    try {
      logoutModel = LogoutModel.fromJson(response.data);
      await CacheHelper.signOut();
      emit(LogoutSuccessState());
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(LogoutErrorState());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(LogoutErrorState());
    }
  }
}
