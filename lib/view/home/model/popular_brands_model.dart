class PopularBrandsModelDataStoreSubCategoryStoreCategory {
  int? id;
  String? name;
  String? image;

  PopularBrandsModelDataStoreSubCategoryStoreCategory({
    this.id,
    this.name,
    this.image,
  });
  PopularBrandsModelDataStoreSubCategoryStoreCategory.fromJson(
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

class PopularBrandsModelDataStoreSubCategory {
  int? id;
  String? name;
  String? image;
  PopularBrandsModelDataStoreSubCategoryStoreCategory? storeCategory;

  PopularBrandsModelDataStoreSubCategory({
    this.id,
    this.name,
    this.image,
    this.storeCategory,
  });
  PopularBrandsModelDataStoreSubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
    storeCategory = (json['store_category'] != null)
        ? PopularBrandsModelDataStoreSubCategoryStoreCategory.fromJson(
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

class PopularBrandsModelData {
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
  PopularBrandsModelDataStoreSubCategory? storeSubCategory;

  PopularBrandsModelData({
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
  PopularBrandsModelData.fromJson(Map<String, dynamic> json) {
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
        ? PopularBrandsModelDataStoreSubCategory.fromJson(
            json['store_sub_category'])
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

class PopularBrandsModel {
  int? status;
  String? message;
  List<PopularBrandsModelData?>? data;

  PopularBrandsModel({
    this.status,
    this.message,
    this.data,
  });
  PopularBrandsModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toInt();
    message = json['message']?.toString();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <PopularBrandsModelData>[];
      v.forEach((v) {
        arr0.add(PopularBrandsModelData.fromJson(v));
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
