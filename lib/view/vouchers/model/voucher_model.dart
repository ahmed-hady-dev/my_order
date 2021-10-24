class VoucherModel {
  VoucherModel({
    this.status,
    this.message,
    this.data,
  });

  VoucherModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  int? status;
  String? message;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.code,
    this.discount,
    this.startAt,
    this.endAt,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    code = json['code'];
    discount = json['discount'];
    startAt = json['start_at'];
    endAt = json['end_at'];
  }
  int? id;
  String? code;
  int? discount;
  String? startAt;
  String? endAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['code'] = code;
    map['discount'] = discount;
    map['start_at'] = startAt;
    map['end_at'] = endAt;
    return map;
  }
}
