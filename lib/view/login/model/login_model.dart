// class LoginModel {
//   String? accessToken;
//   String? tokenType;
//   int? status;
//   String? message;
//   LoginModelData? data;
//
//   LoginModel({
//     this.accessToken,
//     this.tokenType,
//     this.data,
//     this.message,
//     this.status,
//   });
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     accessToken = json["access_token"]?.toString();
//     tokenType = json["token_type"]?.toString();
//     status = json["status"]?.toInt();
//     message = json["message"]?.toString();
//     data =
//         (json["data"] != null) ? LoginModelData.fromJson(json["data"]) : null;
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["access_token"] = accessToken;
//     data["token_type"] = tokenType;
//     data["data"] = this.data!.toJson();
//     return data;
//   }
// }
//
// class LoginModelDataAreaCity {
//   int? id;
//   String? name;
//   LoginModelDataAreaCity({
//     this.id,
//     this.name,
//   });
//   LoginModelDataAreaCity.fromJson(Map<String, dynamic> json) {
//     id = json["id"]?.toInt();
//     name = json["name"]?.toString();
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["id"] = id;
//     data["name"] = name;
//     return data;
//   }
// }
//
// class LoginModelData {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? phone;
//   String? image;
//   LoginModelDataArea? area;
//
//   LoginModelData({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.image,
//     this.area,
//   });
//   LoginModelData.fromJson(Map<String, dynamic> json) {
//     id = json["id"]?.toInt();
//     firstName = json["first_name"]?.toString();
//     lastName = json["last_name"]?.toString();
//     email = json["email"]?.toString();
//     phone = json["phone"]?.toString();
//     image = json["image"]?.toString();
//     area = (json["area"] != null)
//         ? LoginModelDataArea.fromJson(json["area"])
//         : null;
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["id"] = id;
//     data["first_name"] = firstName;
//     data["last_name"] = lastName;
//     data["email"] = email;
//     data["phone"] = phone;
//     data["image"] = image;
//     if (area != null) {
//       data["area"] = area!.toJson();
//     }
//     return data;
//   }
// }
//
// class LoginModelDataArea {
//   int? id;
//   String? name;
//   LoginModelDataAreaCity? city;
//
//   LoginModelDataArea({
//     this.id,
//     this.name,
//     this.city,
//   });
//   LoginModelDataArea.fromJson(Map<String, dynamic> json) {
//     id = json["id"]?.toInt();
//     name = json["name"]?.toString();
//     city = (json["city"] != null)
//         ? LoginModelDataAreaCity.fromJson(json["city"])
//         : null;
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["id"] = id;
//     data["name"] = name;
//     if (city != null) {
//       data["city"] = city!.toJson();
//     }
//     return data;
//   }
// }
