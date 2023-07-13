import 'package:isar/isar.dart';
import 'package:pet_adoption/Business/home_page/model/pet_model.dart';
import 'package:pet_adoption/Utils/locator.dart';

class HistoryPageRepository {
  static int perPage = 10;
  static historyPageRepository() async {
    var isar = getIt.get<Isar>();
    await Future.delayed(const Duration(seconds: 2));
    try {
      List<PetDataModel?> dataModel =
          await isar.petDataModels.filter().isAdoptedEqualTo(true).findAll();
      return dataModel;
    } catch (e) {
      return e;
    }
  }
}
