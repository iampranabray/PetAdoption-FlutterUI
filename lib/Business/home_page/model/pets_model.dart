// import 'dart:convert';

// List<PetDataModel> petDataModelFromJson(String str) => List<PetDataModel>.from(
//     json.decode(str).map((x) => PetDataModel.fromJson(x)));

// String petDataModelToJson(List<PetDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class PetDataModel {
//   String? id;
//   bool? isAdopted;
//   String? price;
//   String? picture;
//   int? age;
//   String? name;
//   String? gender;
//   String? address;
//   String? about;

//   PetDataModel({
//     this.id,
//     this.isAdopted,
//     this.price,
//     this.picture,
//     this.age,
//     this.name,
//     this.gender,
//     this.address,
//     this.about,
//   });

//   factory PetDataModel.fromJson(Map<String, dynamic> json) => PetDataModel(
//         id: json["_id"],
//         isAdopted: json["isAdopted"],
//         price: json["price"],
//         picture: json["picture"],
//         age: json["age"],
//         name: json["name"],
//         gender: json["gender"],
//         address: json["address"],
//         about: json["about"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "isAdopted": isAdopted,
//         "price": price,
//         "picture": picture,
//         "age": age,
//         "name": name,
//         "gender": gender,
//         "address": address,
//         "about": about,
//       };
// }


