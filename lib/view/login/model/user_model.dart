class UserModel {
  UserModel({
    this.accessToken,
    this.tokenType,
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  UserModel.fromJson(dynamic json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    status = json['status'];
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? accessToken;
  String? tokenType;
  int? status;
  String? message;
  Errors? errors;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = accessToken;
    map['token_type'] = tokenType;
    map['status'] = status;
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.image,
    this.area,
  });

  Data.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
  }
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? image;
  Area? area;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['image'] = image;
    if (area != null) {
      map['area'] = area?.toJson();
    }
    return map;
  }
}

class Area {
  Area({
    this.id,
    this.name,
    this.city,
  });

  Area.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
  }
  int? id;
  String? name;
  City? city;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (city != null) {
      map['city'] = city?.toJson();
    }
    return map;
  }
}

class City {
  City({
    this.id,
    this.name,
  });

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

class Errors {
  Errors({
    this.email,
    this.phone,
  });

  Errors.fromJson(dynamic json) {
    email = json['email'] != null ? json['email'].cast<String>() : [];
    phone = json['phone'] != null ? json['phone'].cast<String>() : [];
  }
  List<String>? email;
  List<String>? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }
}
