// To parse this JSON data, do
//
//     final storeItemsModel = storeItemsModelFromJson(jsonString);

import 'dart:convert';

StoreItemsModel storeItemsModelFromJson(String str) => StoreItemsModel.fromJson(json.decode(str));

String storeItemsModelToJson(StoreItemsModel data) => json.encode(data.toJson());

class StoreItemsModel {
  StoreItemsModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory StoreItemsModel.fromJson(Map<String, dynamic> json) => StoreItemsModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.image,
    this.items,
  });

  int? id;
  String? name;
  String? image;
  List<Item>? items;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
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
