// To parse this JSON data, do
//
//     final ordersModel = ordersModelFromJson(jsonString);

import 'dart:convert';

OrdersModel ordersModelFromJson(String str) => OrdersModel.fromJson(json.decode(str));

String ordersModelToJson(OrdersModel data) => json.encode(data.toJson());

class OrdersModel {
  OrdersModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  List<Datum>? data;

  factory OrdersModel.fromJson(Map<String, dynamic> json) => OrdersModel(
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

  int?id;
  double? subTotal;
  double? taxes;
  double? deliveryFees;
  double? total;
  String? state;
  String? cancellationReason;
  String? payment;
  String? notes;
  Store? store;
  List<Item>? items;
  List<Offer>? offers;
  dynamic voucher;
  Delivery? delivery;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    subTotal: double.tryParse(json["subTotal"].toString()),
    taxes: json["taxes"] == null ? null : double.tryParse(json["taxes"].toString()),
    deliveryFees: json["delivery_fees"] == null ? null : double.tryParse(json["delivery_fees"].toString()),
    total: double.tryParse(json["total"].toString()),
    state: json["state"],
    cancellationReason: json["cancellation Reason"] == null ? null : json["cancellation Reason"],
    payment: json["payment"],
    notes: json["notes"] == null ? null : json["notes"],
    store: Store.fromJson(json["store"]),
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
    voucher: json["voucher"],
    delivery: json["delivery"] == null ? null : Delivery.fromJson(json["delivery"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subTotal": subTotal,
    "taxes": taxes == null ? null : taxes,
    "delivery_fees": deliveryFees == null ? null : deliveryFees,
    "total": total,
    "state": state,
    "cancellation Reason": cancellationReason == null ? null : cancellationReason,
    "payment": payment,
    "notes": notes == null ? null : notes,
    "store": store!.toJson(),
    "items": List<dynamic>.from(items!.map((x) => x.toJson())),
    "offers": List<dynamic>.from(offers!.map((x) => x.toJson())),
    "voucher": voucher,
    "delivery": delivery == null ? null : delivery!.toJson(),
  };
}

class Delivery {
  Delivery({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.image,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? image;

  factory Delivery.fromJson(Map<String, dynamic> json) => Delivery(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
    "phone": phone,
    "image": image,
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
  ItemPivot? pivot;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
    numOrders: json["num_orders"],
    pivot: ItemPivot.fromJson(json["pivot"]),
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

class ItemPivot {
  ItemPivot({
    this.price,
    this.quantity,
    this.itemSizeId,
    this.extras,
  });

  int? price;
  int? quantity;
  ItemSizeId? itemSizeId;
  List<ItemSizeId>? extras;

  factory ItemPivot.fromJson(Map<String, dynamic> json) => ItemPivot(
    price: json["price"],
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
  int? price;

  factory ItemSizeId.fromJson(Map<String, dynamic> json) => ItemSizeId(
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

class Offer {
  Offer({
    this.id,
    this.nameAr,
    this.descriptionAr,
    this.image,
    this.price,
    this.numOrders,
    this.startAt,
    this.endAt,
    this.pivot,
  });

  int? id;
  String? nameAr;
  String? descriptionAr;
  String? image;
  int? price;
  int? numOrders;
  DateTime? startAt;
  DateTime? endAt;
  OfferPivot? pivot;

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
    id: json["id"],
    nameAr: json["name_ar"],
    descriptionAr: json["description_ar"],
    image: json["image"],
    price: json["price"],
    numOrders: json["num_orders"],
    startAt: DateTime.parse(json["start_at"]),
    endAt: DateTime.parse(json["end_at"]),
    pivot: OfferPivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_ar": nameAr,
    "description_ar": descriptionAr,
    "image": image,
    "price": price,
    "num_orders": numOrders,
  };
}

class OfferPivot {
  OfferPivot({
    this.price,
    this.quantity,
  });

  int? price;
  int? quantity;

  factory OfferPivot.fromJson(Map<String, dynamic> json) => OfferPivot(
    price: json["price"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "price": price,
    "quantity": quantity,
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