import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../Business/home_page/model/pet_model.dart';

final getIt = GetIt.instance;
Future<void> setup() async {
  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open(
    [PetDataModelSchema],
    directory: dir.path,
  );
  getIt.registerSingleton<Isar>(isar);
}
