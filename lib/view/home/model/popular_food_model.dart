class PopularFoodModelDataItemCategoryStore {
  int? id;
  String? name;
  String? description;
  String? image;
  String? rate;
  int? reviewsNumber;
  String? openAt;
  String? closeAt;
  double? deliveryFees;
  double? taxes;

  PopularFoodModelDataItemCategoryStore({
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
  });
  PopularFoodModelDataItemCategoryStore.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    rate = json['rate']?.toString();
    reviewsNumber = json['reviews_number']?.toInt();
    openAt = json['open_at']?.toString();
    closeAt = json['close_at']?.toString();
    deliveryFees = json['delivery_fees']?.toDouble();
    taxes = json['taxes']?.toDouble();
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
    return data;
  }
}

class PopularFoodModelDataItemCategory {
  int? id;
  String? name;
  String? image;
  PopularFoodModelDataItemCategoryStore? store;

  PopularFoodModelDataItemCategory({
    this.id,
    this.name,
    this.image,
    this.store,
  });
  PopularFoodModelDataItemCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
    store = (json['store'] != null)
        ? PopularFoodModelDataItemCategoryStore.fromJson(json['store'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    return data;
  }
}

class PopularFoodModelData {
  int? id;
  String? name;
  String? description;
  String? image;
  int? numOrders;
  PopularFoodModelDataItemCategory? itemCategory;

  PopularFoodModelData({
    this.id,
    this.name,
    this.description,
    this.image,
    this.numOrders,
    this.itemCategory,
  });
  PopularFoodModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    numOrders = json['num_orders']?.toInt();
    itemCategory = (json['item_category'] != null)
        ? PopularFoodModelDataItemCategory.fromJson(json['item_category'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['num_orders'] = numOrders;
    if (itemCategory != null) {
      data['item_category'] = itemCategory!.toJson();
    }
    return data;
  }
}

class PopularFoodModel {
  int? status;
  String? message;
  List<PopularFoodModelData?>? data;

  PopularFoodModel({
    this.status,
    this.message,
    this.data,
  });
  PopularFoodModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toInt();
    message = json['message']?.toString();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <PopularFoodModelData>[];
      v.forEach((v) {
        arr0.add(PopularFoodModelData.fromJson(v));
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
