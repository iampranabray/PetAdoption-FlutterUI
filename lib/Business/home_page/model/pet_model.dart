import 'package:isar/isar.dart';

part 'pet_model.g.dart';

@collection
class PetDataModel {
  Id id = Isar.autoIncrement;
  bool isAdopted;
  String price;
  String picture;
  int age;
  String name;
  String gender;
  String address;
  String about;
  int adoptedTime;

  PetDataModel(
      {required this.id,
      required this.isAdopted,
      required this.price,
      required this.picture,
      required this.age,
      required this.name,
      required this.gender,
      required this.address,
      required this.about,
      required this.adoptedTime});
}
