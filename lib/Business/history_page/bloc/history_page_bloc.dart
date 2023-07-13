import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_adoption/Business/history_page/repository/history_page_repo.dart';
import 'package:pet_adoption/Business/home_page/model/pet_model.dart';

part 'history_page_event.dart';
part 'history_page_state.dart';

class HistoryPageBloc extends Bloc<HistoryPageEvent, HistoryPageState> {
  HistoryPageBloc() : super(const HistoryPageState()) {
    on<FetchPetHistoryInfinitList>(fetchPetInfinitList);
  }

  fetchPetInfinitList(
      FetchPetHistoryInfinitList event, Emitter<HistoryPageState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == HistoryPageStatus.initial) {
        List<PetDataModel> petDataList =
            await HistoryPageRepository.historyPageRepository();

// //addopted pets filter
        // List<PetDataModel> petFilterDataList = [];
        // List<PetDataModel> filterData = petDataList
        //     .where((element) => (element.isAdopted == true))
        //     .toList();

        emit(state.copyWith(
            petData: petDataList,
            status: HistoryPageStatus.success,
            hasReachedMax:
                List.of(petDataList).length < HistoryPageRepository.perPage
                    ? true
                    : false));
      }
    } catch (e) {
      emit(state.copyWith(status: HistoryPageStatus.failure));
    }
  }
}
