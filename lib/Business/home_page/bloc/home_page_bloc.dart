import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:pet_adoption/Business/home_page/model/pet_model.dart';
import 'package:pet_adoption/Business/home_page/repository/home_page_repo.dart';
import 'package:pet_adoption/Utils/locator.dart';

part "home_page_event.dart";
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<FetchPetInfinitList>(fetchPetInfinitList);
    on<AdoptPet>(adoptPet);
  }

  fetchPetInfinitList(
      FetchPetInfinitList event, Emitter<HomePageState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == HomePageStatus.initial) {
        List<PetDataModel> petDataList =
            await HomePageRepository.homePageRepository();
        emit(state.copyWith(
            petData: petDataList,
            status: HomePageStatus.success,
            hasReachedMax:
                List.of(petDataList).length < HomePageRepository.perPage
                    ? true
                    : false));
      }
    } catch (e) {
      emit(state.copyWith(status: HomePageStatus.failure));
    }
  }

  adoptPet(AdoptPet event, Emitter<HomePageState> emit) async {
    var isar = getIt.get<Isar>();

    await isar.writeTxn(() async {
      PetDataModel? data =
          await isar.petDataModels.get(int.parse(event.id ?? "0"));
      data?.isAdopted = true;

      await isar.petDataModels.put(data!);
    });

    for (int i = 0; i < state.petData.length; i++) {
      if (state.petData[i].id.toString() == event.id) {
        state.petData[i].isAdopted = true;
        break;
      }
    }
    emit(
      state.copyWith(
        status: HomePageStatus.success,
        petData: state.petData,
        hasReachedMax: false,
      ),
    );
  }
}
