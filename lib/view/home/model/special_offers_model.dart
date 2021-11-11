class SpecialOffersModelDataStore {
  int? id;
  String? name;
  String? description;
  String? image;
  String? rate;
  double? reviewsNumber;
  String? openAt;
  String? closeAt;
  double? deliveryFees;
  double? taxes;
  double? minOrder;

  SpecialOffersModelDataStore({
    this.id,
    this.name,
    this.description,
    this.image,
    this.rate,
    this.reviewsNumber,
    this.openAt,
    this.closeAt,
    this.deliveryFees,
    this.taxes,
    this.minOrder,
  });
  SpecialOffersModelDataStore.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    rate = json['rate']?.toString();
    reviewsNumber = json['reviews_number']?.toDouble();
    openAt = json['open_at']?.toString();
    closeAt = json['close_at']?.toString();
    deliveryFees = json['delivery_fees']?.toDouble();
    taxes = json['taxes']?.toDouble();
    minOrder = json['min_order']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['rate'] = rate;
    data['reviews_number'] = reviewsNumber;
    data['open_at'] = openAt;
    data['close_at'] = closeAt;
    data['delivery_fees'] = deliveryFees;
    data['taxes'] = taxes;
    data['min_order'] = minOrder;
    return data;
  }
}

class SpecialOffersModelData {
  int? id;
  String? name;
  String? description;
  String? image;
  double? price;
  int? numOrders;
  String? startAt;
  String? endAt;
  SpecialOffersModelDataStore? store;

  SpecialOffersModelData({
    this.id,
    this.name,
    this.description,
    this.image,
    this.price,
    this.numOrders,
    this.startAt,
    this.endAt,
    this.store,
  });
  SpecialOffersModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    price = json['price']?.toDouble();
    numOrders = json['num_orders']?.toInt();
    startAt = json['start_at']?.toString();
    endAt = json['end_at']?.toString();
    store = (json['store'] != null)
        ? SpecialOffersModelDataStore.fromJson(json['store'])
        : null;
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
    if (store != null) {
      data['store'] = store!.toJson();
    }
    return data;
  }
}

class SpecialOffersModel {
  int? status;
  String? message;
  List<SpecialOffersModelData?>? data;

  SpecialOffersModel({
    this.status,
    this.message,
    this.data,
  });
  SpecialOffersModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toInt();
    message = json['message']?.toString();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <SpecialOffersModelData>[];
      v.forEach((v) {
        arr0.add(SpecialOffersModelData.fromJson(v));
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
