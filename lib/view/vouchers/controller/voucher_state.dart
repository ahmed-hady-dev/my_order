part of 'voucher_cubit.dart';

@immutable
abstract class VoucherState {}

class VoucherInitial extends VoucherState {}
//===============================================================

class AllVoucherLoading extends VoucherState {}

class AllVoucherSuccess extends VoucherState {
  final VoucherModel voucherModel;

  AllVoucherSuccess({required this.voucherModel});
}

class AllVoucherError extends VoucherState {}
//===============================================================

class ActiveVoucherLoading extends VoucherState {}

class ActiveVoucherSuccess extends VoucherState {
  final VoucherModel voucherModel;

  ActiveVoucherSuccess({required this.voucherModel});
}

class ActiveVoucherError extends VoucherState {}
//===============================================================

class UsedVoucherLoading extends VoucherState {}

class UsedVoucherSuccess extends VoucherState {
  final VoucherModel voucherModel;
  UsedVoucherSuccess({required this.voucherModel});
}

class UsedVoucherError extends VoucherState {}
//===============================================================

class ExpiredVoucherLoading extends VoucherState {}

class ExpiredVoucherSuccess extends VoucherState {
  final VoucherModel voucherModel;

  ExpiredVoucherSuccess({required this.voucherModel});
}

class ExpiredVoucherError extends VoucherState {}
