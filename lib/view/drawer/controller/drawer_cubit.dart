import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/constants.dart';
import '../../../core/cacheHelper/cache_helper.dart';
import '../../../core/dioHelper/dio_helper.dart';
import '../model/logout_model.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());
  static DrawerCubit get(context) => BlocProvider.of(context);
  //===============================================================
  LogoutModel? logoutModel;
  int isSelected = 0;
  int get getCurrentItem => isSelected;
  //===============================================================
  void itemSelection(int value) {
    isSelected = value;
    emit(DrawerSelectedItem());
    isSelected = 0;
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
