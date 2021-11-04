class StoreModelDataArea {
  int? id;
  String? name;

  StoreModelDataArea({
    this.id,
    this.name,
  });
  StoreModelDataArea.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
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
  int? deliveryFees;
  int? taxes;
  StoreModelDataArea? area;

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
    this.area,
  });
  StoreModelData.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    name = json["name"]?.toString();
    description = json["description"]?.toString();
    image = json["image"]?.toString();
    rate = json["rate"]?.toString();
    reviewsNumber = json["reviews_number"]?.toInt();
    openAt = json["open_at"]?.toString();
    closeAt = json["close_at"]?.toString();
    deliveryFees = json["delivery_fees"]?.toInt();
    taxes = json["taxes"]?.toInt();
    area = (json["area"] != null)
        ? StoreModelDataArea.fromJson(json["area"])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["image"] = image;
    data["rate"] = rate;
    data["reviews_number"] = reviewsNumber;
    data["open_at"] = openAt;
    data["close_at"] = closeAt;
    data["delivery_fees"] = deliveryFees;
    data["taxes"] = taxes;
    if (area != null) {
      data["area"] = area!.toJson();
    }
    return data;
  }
}

class StoreOfCategoryModel {
  int? status;
  String? message;
  List<StoreModelData?>? data;

  StoreOfCategoryModel({
    this.status,
    this.message,
    this.data,
  });
  StoreOfCategoryModel.fromJson(Map<String, dynamic> json) {
    status = json["status"]?.toInt();
    message = json["message"]?.toString();
    if (json["data"] != null) {
      final v = json["data"];
      final arr0 = <StoreModelData>[];
      v.forEach((v) {
        arr0.add(StoreModelData.fromJson(v));
      });
      data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data["data"] = arr0;
    }
    return data;
  }
}
