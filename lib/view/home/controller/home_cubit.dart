import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_order/constants/constants.dart';
import 'package:my_order/core/dioHelper/dio_helper.dart';
import 'package:my_order/view/home/model/store_categories_model.dart';
import 'package:my_order/view/home/model/store_sub_categories_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
//===============================================================
  StoreCategoriesModel? storeCategoriesModel;
  StoreSubCategoriesModel? storeSubCategoriesModel;
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
    final response =
        await DioHelper.getData(url: storeCategories, lang: language);
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
  } //===============================================================

  Future<void> getStoreSubCategories() async {
    emit(GetStoreSubCategoriesLoading());
    final response =
        await DioHelper.getData(url: storeSubCategories, lang: language);
    try {
      storeSubCategoriesModel = StoreSubCategoriesModel.fromJson(response.data);
      emit(GetStoreSubCategoriesSuccess(
          storeSubCategoriesModel: storeSubCategoriesModel!));
    } on DioError catch (e) {
      debugPrint(e.error.toString());
      emit(GetStoreSubCategoriesError());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      emit(GetStoreSubCategoriesError());
    }
  }
}
