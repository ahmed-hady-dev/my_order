import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
//===============================================================
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
}
