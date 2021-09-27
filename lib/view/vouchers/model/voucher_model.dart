class VoucherModel {
  final double percentage;
  final String discountText;
  final String discountCode;

  VoucherModel(
      {required this.percentage,
      required this.discountText,
      required this.discountCode});
}

List<VoucherModel> voucherList = [
  VoucherModel(
    percentage: 30,
    discountText: 'Discount for any order',
    discountCode: '#252545',
  ),
  VoucherModel(
    percentage: 30,
    discountText: 'Discount for any order',
    discountCode: '#252545',
  ),
  VoucherModel(
    percentage: 30,
    discountText: 'Discount for any order',
    discountCode: '#252545',
  ),
  VoucherModel(
    percentage: 30,
    discountText: 'Discount for any order',
    discountCode: '#252545',
  ),
];
