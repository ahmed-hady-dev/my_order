part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}

class OrderCounterChange extends OrderState {}

class RadioButtonChange extends OrderState {}
