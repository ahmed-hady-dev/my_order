class LoginModelData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? image;

  LoginModelData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.image,
  });
  LoginModelData.fromJson(Map<String, dynamic> json) {
    id = json["id"]?.toInt();
    firstName = json["first_name"]?.toString();
    lastName = json["last_name"]?.toString();
    email = json["email"]?.toString();
    phone = json["phone"]?.toString();
    image = json["image"]?.toString();
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["first_name"] = firstName;
    data["last_name"] = lastName;
    data["email"] = email;
    data["phone"] = phone;
    data["image"] = image;
    return data;
  }
}

class LoginModel {
  String? accessToken;
  String? tokenType;
  LoginModelData? data;
  int? status;
  String? message;

  LoginModel({
    this.accessToken,
    this.tokenType,
    this.data,
    this.message,
    this.status,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json["access_token"]?.toString();
    tokenType = json["token_type"]?.toString();
    status = json["status"]?.toInt();
    message = json["message"]?.toString();
    data =
        (json["data"] != null) ? LoginModelData.fromJson(json["data"]) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["access_token"] = accessToken;
    data["token_type"] = tokenType;
    data["data"] = this.data!.toJson();
    return data;
  }
}
