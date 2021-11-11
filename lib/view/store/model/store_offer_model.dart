class StoreOfferModelData {
  int? id;
  String? name;
  String? description;
  String? image;
  double? price;
  int? numOrders;
  String? startAt;
  String? endAt;

  StoreOfferModelData({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.numOrders,
    this.startAt,
    this.endAt,
  });
  StoreOfferModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    price = json['price']?.toDouble();
    numOrders = json['num_orders']?.toInt();
    startAt = json['start_at']?.toString();
    endAt = json['end_at']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['num_orders'] = numOrders;
    data['start_at'] = startAt;
    data['end_at'] = endAt;
    return data;
  }
}

class StoreOfferModel {
  int? status;
  String? message;
  List<StoreOfferModelData?>? data;

  StoreOfferModel({
    this.status,
    this.message,
    this.data,
  });
  StoreOfferModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toInt();
    message = json['message']?.toString();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <StoreOfferModelData>[];
      v.forEach((v) {
        arr0.add(StoreOfferModelData.fromJson(v));
      });
      data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['data'] = arr0;
    }
    return data;
  }
}
