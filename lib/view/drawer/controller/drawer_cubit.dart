import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial());
  static DrawerCubit get(context) => BlocProvider.of(context);
  //===============================================================
  int isSelected = 0;
  int get getCurrentItem => isSelected;
  //===============================================================
  void itemSelection(int value) {
    isSelected = value;
    emit(DrawerSelectedItem());
  }
}
