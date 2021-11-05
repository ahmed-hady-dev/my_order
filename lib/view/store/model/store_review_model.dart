class StoreReviewModelDataStore {
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
  int? minOrder;

  StoreReviewModelDataStore({
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
  StoreReviewModelDataStore.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    rate = json['rate']?.toString();
    reviewsNumber = json['reviews_number']?.toInt();
    openAt = json['open_at']?.toString();
    closeAt = json['close_at']?.toString();
    deliveryFees = json['delivery_fees']?.toInt();
    taxes = json['taxes']?.toInt();
    minOrder = json['min_order']?.toInt();
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

class StoreReviewModelDataClient {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? image;

  StoreReviewModelDataClient({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.image,
  });
  StoreReviewModelDataClient.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    firstName = json['first_name']?.toString();
    lastName = json['last_name']?.toString();
    email = json['email']?.toString();
    phone = json['phone']?.toString();
    image = json['image']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['phone'] = phone;
    data['image'] = image;
    return data;
  }
}

class StoreReviewModelData {
  int? id;
  String? rate;
  String? comment;
  StoreReviewModelDataClient? client;
  StoreReviewModelDataStore? store;

  StoreReviewModelData({
    this.id,
    this.rate,
    this.comment,
    this.client,
    this.store,
  });
  StoreReviewModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    rate = json['rate']?.toString();
    comment = json['comment']?.toString();
    client = (json['client'] != null)
        ? StoreReviewModelDataClient.fromJson(json['client'])
        : null;
    store = (json['store'] != null)
        ? StoreReviewModelDataStore.fromJson(json['store'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['rate'] = rate;
    data['comment'] = comment;
    if (client != null) {
      data['client'] = client!.toJson();
    }
    if (store != null) {
      data['store'] = store!.toJson();
    }
    return data;
  }
}

class StoreReviewModel {
  int? status;
  String? message;
  List<StoreReviewModelData?>? data;

  StoreReviewModel({
    this.status,
    this.message,
    this.data,
  });
  StoreReviewModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toInt();
    message = json['message']?.toString();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <StoreReviewModelData>[];
      v.forEach((v) {
        arr0.add(StoreReviewModelData.fromJson(v));
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
