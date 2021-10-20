class UpdateUserModelData {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? image;

  UpdateUserModelData({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.image,
  });
  UpdateUserModelData.fromJson(Map<String, dynamic> json) {
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

class UpdateUserModel {
  int? status;
  String? message;
  UpdateUserModelData? data;

  UpdateUserModel({
    this.status,
    this.message,
    this.data,
  });
  UpdateUserModel.fromJson(Map<String, dynamic> json) {
    status = json["status"]?.toInt();
    message = json["message"]?.toString();
    data = (json["data"] != null)
        ? UpdateUserModelData.fromJson(json["data"])
        : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    data["data"] = this.data!.toJson();
    return data;
  }
}
