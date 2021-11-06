// To parse this JSON data, do
//
//     final itemDetailsModel = itemDetailsModelFromJson(jsonString);

import 'dart:convert';

ItemDetailsModel itemDetailsModelFromJson(String str) =>
    ItemDetailsModel.fromJson(json.decode(str));

String itemDetailsModelToJson(ItemDetailsModel data) =>
    json.encode(data.toJson());

class ItemDetailsModel {
  ItemDetailsModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory ItemDetailsModel.fromJson(Map<String, dynamic> json) =>
      ItemDetailsModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.description,
    this.image,
    this.numOrders,
    this.sizes,
    this.extras,
    this.itemCategory,
  });

  int? id;
  String? name;
  String? description;
  String? image;
  int? numOrders;
  List<Extra>? sizes;
  List<Extra>? extras;
  ItemCategory? itemCategory;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        numOrders: json["num_orders"],
        sizes: List<Extra>.from(json["sizes"].map((x) => Extra.fromJson(x))),
        extras: List<Extra>.from(json["extras"].map((x) => Extra.fromJson(x))),
        itemCategory: ItemCategory.fromJson(json["item_category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "num_orders": numOrders,
        "sizes": List<dynamic>.from(sizes!.map((x) => x.toJson())),
        "extras": List<dynamic>.from(extras!.map((x) => x.toJson())),
        "item_category": itemCategory!.toJson(),
      };
}

class Extra {
  Extra({
    this.id,
    this.name,
    this.price,
  });

  int? id;
  String? name;
  int? price;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        id: json["id"],
        name: json["name"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
      };
}

class ItemCategory {
  ItemCategory({
    this.id,
    this.name,
    this.image,
    this.store,
    this.items,
  });

  int? id;
  String? name;
  String? image;
  Store? store;
  List<Item>? items;

  factory ItemCategory.fromJson(Map<String, dynamic> json) => ItemCategory(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        store: Store.fromJson(json["store"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "store": store!.toJson(),
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.numOrders,
  });

  int? id;
  String? name;
  String? description;
  String? image;
  int? numOrders;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        numOrders: json["num_orders"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "num_orders": numOrders,
      };
}

class Store {
  Store({
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
  Area? area;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        rate: json["rate"],
        reviewsNumber: json["reviews_number"],
        openAt: json["open_at"],
        closeAt: json["close_at"],
        deliveryFees: json["delivery_fees"].toDouble(),
        taxes: json["taxes"].toDouble(),
        minOrder: json["min_order"],
        area: Area.fromJson(json["area"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image": image,
        "rate": rate,
        "reviews_number": reviewsNumber,
        "open_at": openAt,
        "close_at": closeAt,
        "delivery_fees": deliveryFees,
        "taxes": taxes,
        "min_order": minOrder,
        "area": area!.toJson(),
      };
}

class Area {
  Area({
    this.id,
    this.name,
    this.city,
  });

  int? id;
  String? name;
  City? city;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
        id: json["id"],
        name: json["name"],
        city: City.fromJson(json["city"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "city": city!.toJson(),
      };
}

class City {
  City({
    this.id,
    this.name,
  });

  int? id;
  String? name;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
