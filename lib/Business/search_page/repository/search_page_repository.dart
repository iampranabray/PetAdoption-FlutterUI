import 'package:isar/isar.dart';
import 'package:pet_adoption/Business/home_page/model/pet_model.dart';
import 'package:pet_adoption/Utils/locator.dart';

class SearchPageRepository {
  static int perPage = 10;

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

  static petFetchInfiniteRepository({int index = 0}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      var offsetCount = index * perPage;
      print(index);

      var isar = getIt.get<Isar>();
      final dataModel = isar.petDataModels;
      final list =
          await dataModel.where().offset(offsetCount).limit(10).findAll();
      //final list = await dataModel.where().limit(offsetCount).findAll();
      return list;
    } catch (e) {
      return e;
    }
  }
}
