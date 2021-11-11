class ItemDetailsModelDataItemCategoryItems {
  int? id;
  String? name;
  String? description;
  String? image;
  int? numOrders;

  ItemDetailsModelDataItemCategoryItems({
    this.id,
    this.name,
    this.description,
    this.image,
    this.numOrders,
  });
  ItemDetailsModelDataItemCategoryItems.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    numOrders = json['num_orders']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['num_orders'] = numOrders;
    return data;
  }
}

class ItemDetailsModelDataItemCategoryStoreAreaCity {
  int? id;
  String? name;

  ItemDetailsModelDataItemCategoryStoreAreaCity({
    this.id,
    this.name,
  });
  ItemDetailsModelDataItemCategoryStoreAreaCity.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class ItemDetailsModelDataItemCategoryStoreArea {
  int? id;
  String? name;
  ItemDetailsModelDataItemCategoryStoreAreaCity? city;

  ItemDetailsModelDataItemCategoryStoreArea({
    this.id,
    this.name,
    this.city,
  });
  ItemDetailsModelDataItemCategoryStoreArea.fromJson(
      Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    city = (json['city'] != null)
        ? ItemDetailsModelDataItemCategoryStoreAreaCity.fromJson(json['city'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class ItemDetailsModelDataItemCategoryStore {
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
  int? minOrder;
  ItemDetailsModelDataItemCategoryStoreArea? area;

  ItemDetailsModelDataItemCategoryStore({
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
    this.area,
  });
  ItemDetailsModelDataItemCategoryStore.fromJson(Map<String, dynamic> json) {
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
    minOrder = json['min_order']?.toInt();
    area = (json['area'] != null)
        ? ItemDetailsModelDataItemCategoryStoreArea.fromJson(json['area'])
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
    data['min_order'] = minOrder;
    if (area != null) {
      data['area'] = area!.toJson();
    }
    return data;
  }
}

class ItemDetailsModelDataItemCategory {
  int? id;
  String? name;
  String? image;
  ItemDetailsModelDataItemCategoryStore? store;
  List<ItemDetailsModelDataItemCategoryItems?>? items;

  ItemDetailsModelDataItemCategory({
    this.id,
    this.name,
    this.image,
    this.store,
    this.items,
  });
  ItemDetailsModelDataItemCategory.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    image = json['image']?.toString();
    store = (json['store'] != null)
        ? ItemDetailsModelDataItemCategoryStore.fromJson(json['store'])
        : null;
    if (json['items'] != null) {
      final v = json['items'];
      final arr0 = <ItemDetailsModelDataItemCategoryItems>[];
      v.forEach((v) {
        arr0.add(ItemDetailsModelDataItemCategoryItems.fromJson(v));
      });
      items = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    if (store != null) {
      data['store'] = store!.toJson();
    }
    if (items != null) {
      final v = items;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['items'] = arr0;
    }
    return data;
  }
}

class ItemDetailsModelDataExtras {
  int? id;
  String? name;
  double? price;

  ItemDetailsModelDataExtras({
    this.id,
    this.name,
    this.price,
  });
  ItemDetailsModelDataExtras.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    price = json['price']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class ItemDetailsModelDataSizes {
  int? id;
  String? name;
  double? price;

  ItemDetailsModelDataSizes({
    this.id,
    this.name,
    this.price,
  });
  ItemDetailsModelDataSizes.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    price = json['price']?.toDouble();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class ItemDetailsModelData {
  int? id;
  String? name;
  String? description;
  String? image;
  int? numOrders;
  List<ItemDetailsModelDataSizes?>? sizes;
  List<ItemDetailsModelDataExtras?>? extras;
  ItemDetailsModelDataItemCategory? itemCategory;

  ItemDetailsModelData({
    this.id,
    this.name,
    this.description,
    this.image,
    this.numOrders,
    this.sizes,
    this.extras,
    this.itemCategory,
  });
  ItemDetailsModelData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    description = json['description']?.toString();
    image = json['image']?.toString();
    numOrders = json['num_orders']?.toInt();
    if (json['sizes'] != null) {
      final v = json['sizes'];
      final arr0 = <ItemDetailsModelDataSizes>[];
      v.forEach((v) {
        arr0.add(ItemDetailsModelDataSizes.fromJson(v));
      });
      sizes = arr0;
    }
    if (json['extras'] != null) {
      final v = json['extras'];
      final arr0 = <ItemDetailsModelDataExtras>[];
      v.forEach((v) {
        arr0.add(ItemDetailsModelDataExtras.fromJson(v));
      });
      extras = arr0;
    }
    itemCategory = (json['item_category'] != null)
        ? ItemDetailsModelDataItemCategory.fromJson(json['item_category'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['num_orders'] = numOrders;
    if (sizes != null) {
      final v = sizes;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['sizes'] = arr0;
    }
    if (extras != null) {
      final v = extras;
      final arr0 = [];
      for (var v in v!) {
        arr0.add(v!.toJson());
      }
      data['extras'] = arr0;
    }
    if (itemCategory != null) {
      data['item_category'] = itemCategory!.toJson();
    }
    return data;
  }
}

class ItemDetailsModel {
  int? status;
  String? message;
  ItemDetailsModelData? data;

  ItemDetailsModel({
    this.status,
    this.message,
    this.data,
  });
  ItemDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toInt();
    message = json['message']?.toString();
    data = (json['data'] != null)
        ? ItemDetailsModelData.fromJson(json['data'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data!.toJson();
    return data;
  }
}
