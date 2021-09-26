class ChoicesModel {
  final String title;
  final double value;

  ChoicesModel({required this.title, required this.value});
}

List<ChoicesModel> sizeChoicesModel = [
  ChoicesModel(title: 'Large', value: 20.0),
  ChoicesModel(title: 'Medium', value: 15.0),
  ChoicesModel(title: 'Small', value: 10.0),
];
List<ChoicesModel> extrasChoicesModel = [
  ChoicesModel(title: 'Liver', value: 10.0),
  ChoicesModel(title: 'chicken', value: 12.0),
];
