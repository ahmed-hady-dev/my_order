part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderButtonLoading extends OrderState {}

class OrderLoading extends OrderState {}
//===============================================================

class GetDetailsLoading extends OrderState {}

class GetDetailsSuccess extends OrderState {}

class GetDetailsError extends OrderState {}
//===============================================================

class OrderCounterChange extends OrderState {}

class RadioButtonChange extends OrderState {}
