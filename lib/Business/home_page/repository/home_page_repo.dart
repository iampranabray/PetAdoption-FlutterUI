import 'package:isar/isar.dart';
import 'package:pet_adoption/Business/home_page/model/pet_model.dart';
import 'package:pet_adoption/Utils/locator.dart';

class HomePageRepository {
  static int perPage = 10;
  static homePageRepository() async {
    try {
      var isar = getIt.get<Isar>();

      final List<PetDataModel?> dataModel =
          await isar.petDataModels.where().limit(20).findAll();

      return dataModel;
    } catch (e) {
      return e;
    }
  }

  static petSearchRepository({String? searchText}) async {
    var isar = getIt.get<Isar>();

    try {
      List<PetDataModel?> dataModel = await isar.petDataModels
          .filter()
          .nameContains(searchText ?? "")
          .findAll();
      return dataModel;
    } catch (e) {
      return e;
    }
  }
}
