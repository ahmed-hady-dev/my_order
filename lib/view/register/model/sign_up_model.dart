// class SignUpModelDataAreaCity {
//   int? id;
//   String? name;
//
//   SignUpModelDataAreaCity({
//     this.id,
//     this.name,
//   });
//   SignUpModelDataAreaCity.fromJson(Map<String, dynamic> json) {
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
// class SignUpModelDataArea {
//   int? id;
//   String? name;
//   SignUpModelDataAreaCity? city;
//
//   SignUpModelDataArea({
//     this.id,
//     this.name,
//     this.city,
//   });
//   SignUpModelDataArea.fromJson(Map<String, dynamic> json) {
//     id = json["id"]?.toInt();
//     name = json["name"]?.toString();
//     city = (json["city"] != null)
//         ? SignUpModelDataAreaCity.fromJson(json["city"])
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
//
// class SignUpModelData {
//   int? id;
//   String? firstName;
//   String? lastName;
//   String? email;
//   String? phone;
//   String? image;
//   SignUpModelDataArea? area;
//
//   SignUpModelData({
//     this.id,
//     this.firstName,
//     this.lastName,
//     this.email,
//     this.phone,
//     this.image,
//     this.area,
//   });
//   SignUpModelData.fromJson(Map<String, dynamic> json) {
//     id = json["id"]?.toInt();
//     firstName = json["first_name"]?.toString();
//     lastName = json["last_name"]?.toString();
//     email = json["email"]?.toString();
//     phone = json["phone"]?.toString();
//     image = json["image"]?.toString();
//     area = (json["area"] != null)
//         ? SignUpModelDataArea.fromJson(json["area"])
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
// class SignUpModelErrors {
//   List<String?>? email;
//   List<String?>? phone;
//
//   SignUpModelErrors({
//     this.email,
//     this.phone,
//   });
//   SignUpModelErrors.fromJson(Map<String, dynamic> json) {
//     if (json["email"] != null) {
//       final v = json["email"];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       email = arr0;
//     }
//     if (json["phone"] != null) {
//       final v = json["phone"];
//       final arr0 = <String>[];
//       v.forEach((v) {
//         arr0.add(v.toString());
//       });
//       phone = arr0;
//     }
//   }
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (email != null) {
//       final v = email;
//       final arr0 = [];
//       for (var v in v!) {
//         arr0.add(v);
//       }
//       data["email"] = arr0;
//     }
//     if (phone != null) {
//       final v = phone;
//       final arr0 = [];
//       for (var v in v!) {
//         arr0.add(v);
//       }
//       data["phone"] = arr0;
//     }
//     return data;
//   }
// }
//
// class SignUpModel {
//   String? accessToken;
//   String? tokenType;
//   SignUpModelData? data;
//   String? message;
//   SignUpModelErrors? errors;
//
//   SignUpModel({
//     this.accessToken,
//     this.tokenType,
//     this.data,
//     this.message,
//     this.errors,
//   });
//   SignUpModel.fromJson(Map<String, dynamic> json) {
//     accessToken = json["access_token"]?.toString();
//     tokenType = json["token_type"]?.toString();
//     message = json["message"]?.toString();
//     errors = (json["errors"] != null)
//         ? SignUpModelErrors.fromJson(json["errors"])
//         : null;
//     data =
//         (json["data"] != null) ? SignUpModelData.fromJson(json["data"]) : null;
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
// //===============================================================
//
// // class SignUpModelData {
// //   int? id;
// //   String? firstName;
// //   String? lastName;
// //   String? email;
// //   String? phone;
// //   String? image;
// //
// //   SignUpModelData({
// //     this.id,
// //     this.firstName,
// //     this.lastName,
// //     this.email,
// //     this.phone,
// //     this.image,
// //   });
// //   SignUpModelData.fromJson(Map<String, dynamic> json) {
// //     id = json["id"]?.toInt();
// //     firstName = json["first_name"]?.toString();
// //     lastName = json["last_name"]?.toString();
// //     email = json["email"]?.toString();
// //     phone = json["phone"]?.toString();
// //     image = json["image"]?.toString();
// //   }
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data["id"] = id;
// //     data["first_name"] = firstName;
// //     data["last_name"] = lastName;
// //     data["email"] = email;
// //     data["phone"] = phone;
// //     data["image"] = image;
// //     return data;
// //   }
// // }
// //
// // class SignUpModelErrors {
// //   List<String?>? email;
// //   List<String?>? phone;
// //
// //   SignUpModelErrors({
// //     this.email,
// //     this.phone,
// //   });
// //   SignUpModelErrors.fromJson(Map<String, dynamic> json) {
// //     if (json["email"] != null) {
// //       final v = json["email"];
// //       final arr0 = <String>[];
// //       v.forEach((v) {
// //         arr0.add(v.toString());
// //       });
// //       email = arr0;
// //     }
// //     if (json["phone"] != null) {
// //       final v = json["phone"];
// //       final arr0 = <String>[];
// //       v.forEach((v) {
// //         arr0.add(v.toString());
// //       });
// //       phone = arr0;
// //     }
// //   }
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     if (email != null) {
// //       final v = email;
// //       final arr0 = [];
// //       for (var v in v!) {
// //         arr0.add(v);
// //       }
// //       data["email"] = arr0;
// //     }
// //     if (phone != null) {
// //       final v = phone;
// //       final arr0 = [];
// //       for (var v in v!) {
// //         arr0.add(v);
// //       }
// //       data["phone"] = arr0;
// //     }
// //     return data;
// //   }
// // }
//
// // class SignUpModel {
// //   String? accessToken;
// //   String? tokenType;
// //   SignUpModelData? data;
// //   String? message;
// //   SignUpModelErrors? errors;
// //
// //   SignUpModel({
// //     this.accessToken,
// //     this.tokenType,
// //     this.data,
// //     this.message,
// //     this.errors,
// //   });
// //
// //   SignUpModel.fromJson(Map<String, dynamic> json) {
// //     accessToken = json["access_token"]?.toString();
// //     tokenType = json["token_type"]?.toString();
// //     message = json["message"]?.toString();
// //     errors = (json["errors"] != null)
// //         ? SignUpModelErrors.fromJson(json["errors"])
// //         : null;
// //     data =
// //         (json["data"] != null) ? SignUpModelData.fromJson(json["data"]) : null;
// //   }
// //   Map<String, dynamic> toJson() {
// //     final Map<String, dynamic> data = <String, dynamic>{};
// //     data["access_token"] = accessToken;
// //     data["token_type"] = tokenType;
// //     data["data"] = this.data!.toJson();
// //     return data;
// //   }
// // }
