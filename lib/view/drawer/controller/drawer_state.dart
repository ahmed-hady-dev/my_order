part of 'drawer_cubit.dart';

@immutable
abstract class DrawerState {}

class DrawerInitial extends DrawerState {}

class DrawerSelectedItem extends DrawerState {}

class LogoutLoadingState extends DrawerState {}

class LogoutErrorState extends DrawerState {}

class LogoutSuccessState extends DrawerState {}
