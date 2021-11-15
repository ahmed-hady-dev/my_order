// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
  CartModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  Data? data;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
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
    this.subTotal,
    this.taxes,
    this.deliveryFees,
    this.total,
    this.state,
    this.cancellationReason,
    this.payment,
    this.notes,
    this.store,
    this.items,
    this.offers,
    this.voucher,
    this.delivery,
  });

  int? id;
  double? subTotal;
  double? taxes;
  double? deliveryFees;
  double? total;
  String? state;
  dynamic cancellationReason;
  String? payment;
  dynamic notes;
  Store? store;
  List<Item>? items;
  List<dynamic>? offers;
  dynamic voucher;
  dynamic delivery;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    subTotal: double.tryParse(json["subTotal"].toString()),
    taxes: double.tryParse(json["taxes"].toString()),
    deliveryFees: double.tryParse(json["delivery_fees"].toString()),
    total: double.tryParse(json["total"].toString()),
    state: json["state"],
    cancellationReason: json["cancellation Reason"],
    payment: json["payment"],
    notes: json["notes"],
    store: Store.fromJson(json["store"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    offers: List<dynamic>.from(json["offers"].map((x) => x)),
    voucher: json["voucher"],
    delivery: json["delivery"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subTotal": subTotal,
    "taxes": taxes,
    "delivery_fees": deliveryFees,
    "total": total,
    "state": state,
    "cancellation Reason": cancellationReason,
    "payment": payment,
    "notes": notes,
    "store": store!.toJson(),
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "offers": List<dynamic>.from(offers!.map((x) => x)),
    "voucher": voucher,
    "delivery": delivery,
  };
}

class Item {
  Item({
    this.id,
    this.name,
    this.description,
    this.image,
    this.numOrders,
    this.pivot,
  });

  int? id;
  String? name;
  String? description;
  String? image;
  int? numOrders;
  Pivot? pivot;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    numOrders: json["num_orders"],
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "image": image,
    "num_orders": numOrders,
    "pivot": pivot!.toJson(),
  };
}

class Pivot {
  Pivot({
    this.price,
    this.quantity,
    this.itemSizeId,
    this.extras,
  });

  double? price;
  int? quantity;
  ItemSizeId? itemSizeId;
  List<ItemSizeId>? extras;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    price: double.tryParse(json["price"].toString()),
    quantity: json["quantity"],
    itemSizeId: ItemSizeId.fromJson(json["item_size_id"]),
    extras: List<ItemSizeId>.from(json["extras"].map((x) => ItemSizeId.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "quantity": quantity,
    "item_size_id": itemSizeId!.toJson(),
    "extras": List<dynamic>.from(extras!.map((x) => x.toJson())),
  };
}

class ItemSizeId {
  ItemSizeId({
    this.id,
    this.name,
    this.price,
  });

  int? id;
  String? name;
  double? price;

  factory ItemSizeId.fromJson(Map<String, dynamic> json) => ItemSizeId(
    id: json["id"],
    name: json["name"],
    price: double.tryParse(json["price"].toString()),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
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

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    rate: json["rate"],
    reviewsNumber: json["reviews_number"],
    openAt: json["open_at"],
    closeAt: json["close_at"],
    deliveryFees: double.tryParse(json["delivery_fees"].toString()),
    taxes: double.tryParse(json["taxes"].toString()),
    minOrder: json["min_order"],
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
  };
}
