class FilterButtonModel {
  String text;
  bool isSelected;

  FilterButtonModel({required this.text, required this.isSelected});
}

List<FilterButtonModel> searchFilterButtonList = [
  FilterButtonModel(text: 'Fast delivery (within3min)', isSelected: false),
  FilterButtonModel(text: 'Free delivery', isSelected: false),
  FilterButtonModel(text: 'Top rated', isSelected: true),
  FilterButtonModel(
      text: 'price: \$ -\$\$ (low and average prices)', isSelected: false),
  FilterButtonModel(text: 'Newly added', isSelected: false),
  FilterButtonModel(text: 'No minimum order', isSelected: false),
];
List<FilterButtonModel> filterResultButtonList = [
  FilterButtonModel(text: 'Fast delivery (within3min)', isSelected: false),
  FilterButtonModel(text: 'Free delivery', isSelected: false),
  FilterButtonModel(text: 'Top rated', isSelected: true),
  FilterButtonModel(
      text: 'price: \$ -\$\$ (low and average prices)', isSelected: false),
  FilterButtonModel(text: 'Newly added', isSelected: false),
  FilterButtonModel(text: 'No minimum order', isSelected: false),
];
List<FilterButtonModel> popularFilterButtonList = [
  FilterButtonModel(text: 'Fast delivery (within3min)', isSelected: false),
  FilterButtonModel(text: 'Free delivery', isSelected: false),
  FilterButtonModel(text: 'Top rated', isSelected: true),
  FilterButtonModel(
      text: 'price: \$ -\$\$ (low and average prices)', isSelected: false),
  FilterButtonModel(text: 'Newly added', isSelected: false),
  FilterButtonModel(text: 'No minimum order', isSelected: false),
];
List<FilterButtonModel> dealsAndOffersButtonList = [
  FilterButtonModel(text: 'Summer offers', isSelected: false),
  FilterButtonModel(text: 'Delivered by us', isSelected: false),
  FilterButtonModel(text: 'Koshary lovers', isSelected: true),
  FilterButtonModel(text: 'User Voucher Here', isSelected: false),
  FilterButtonModel(text: 'Save with visa', isSelected: false),
  FilterButtonModel(text: 'Healthy Mix', isSelected: false),
  FilterButtonModel(text: 'Free Delivery', isSelected: false),
  FilterButtonModel(text: 'Newly Added', isSelected: false),
  FilterButtonModel(text: 'All Deals', isSelected: false),
];
List<FilterButtonModel> sortByButtonList = [
  FilterButtonModel(text: 'Recommendation', isSelected: false),
  FilterButtonModel(text: 'Min.Order Amount', isSelected: false),
  FilterButtonModel(text: 'Fastest Delivery', isSelected: false),
  FilterButtonModel(text: 'A to Z', isSelected: false),
  FilterButtonModel(text: 'Rating', isSelected: false),
];
