class StoreModelDataStoreSubCategoryStoreCategory {
  int? id;
  String? name;
  String? image;

  StoreModelDataStoreSubCategoryStoreCategory({
    this.id,
    this.name,
    this.image,
  });
  StoreModelDataStoreSubCategoryStoreCategory.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class StoreModelDataStoreSubCategory {
  int? id;
  String? name;
  String? image;
  StoreModelDataStoreSubCategoryStoreCategory? storeCategory;

  StoreModelDataStoreSubCategory({
    this.id,
    this.name,
    this.image,
    this.storeCategory,
  });
  StoreModelDataStoreSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
    storeCategory = (json['store_category'] != null)
        ? StoreModelDataStoreSubCategoryStoreCategory.fromJson(
            json['store_category'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (storeCategory != null) {
      data['store_category'] = storeCategory!.toJson();
    }
    return data;
  }
}

class StoreModelData {
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
  StoreModelDataStoreSubCategory? storeSubCategory;

  StoreModelData({
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
    this.storeSubCategory,
  });
  StoreModelData.fromJson(Map<String, dynamic> json) {
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
    storeSubCategory = (json['store_sub_category'] != null)
        ? StoreModelDataStoreSubCategory.fromJson(json['store_sub_category'])
        : null;
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
    if (storeSubCategory != null) {
      data['store_sub_category'] = storeSubCategory!.toJson();
    }
    return data;
  }
}

class StoreModel {
  int? status;
  String? message;
  StoreModelData? data;

  StoreModel({
    this.status,
    this.message,
    this.data,
  });
  StoreModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toInt();
    message = json['message']?.toString();
    data =
        (json['data'] != null) ? StoreModelData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data!.toJson();
    return data;
  }
}
