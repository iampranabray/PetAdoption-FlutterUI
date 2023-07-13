import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pet_adoption/Business/home_page/model/pet_model.dart';
import 'package:pet_adoption/Business/search_page/repository/search_page_repository.dart';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

part "search_page_event.dart";
part "search_page_state.dart";

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

const throttleDuration = Duration(milliseconds: 100);

class SearchPageBloc extends Bloc<SearchPageEvent, SearchPageState> {
  SearchPageBloc() : super(const SearchPageState()) {
    on<SearchPet>(searchPet);
    on<SearchPetInfinite>(fetchInfinite,
        transformer: throttleDroppable(throttleDuration));
  }

  searchPet(SearchPet event, Emitter<SearchPageState> emit) async {
    if (event.searchText.isNotEmpty) {
      emit(
        state.copyWith(
          hasReachedMax: false,
        ),
      );
    }
    if (state.hasReachedMax) return;
    try {
      final petData = await SearchPageRepository.petSearchRepository(
        searchText: event.searchText,
      );

      emit(
        state.copyWith(
          status: SearchPageStatus.success,
          petData: petData,
          hasReachedMax: false,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: SearchPageStatus.failure));
    }
  }

  fetchInfinite(SearchPetInfinite event, Emitter<SearchPageState> emit) async {
    if (state.hasReachedMax) return;
    try {
      if (state.status == SearchPageStatus.initial) {
        List<PetDataModel> petDataList =
            await SearchPageRepository.petFetchInfiniteRepository();

        emit(state.copyWith(
            petData: petDataList,
            status: SearchPageStatus.success,
            hasReachedMax:
                List.of(petDataList).length < SearchPageRepository.perPage
                    ? true
                    : false));
      }
      if (!state.hasReachedMax) {
        if (state.status == SearchPageStatus.failure) {
          List<PetDataModel> petDataList =
              await SearchPageRepository.petFetchInfiniteRepository(index: 0);

          emit(
            state.copyWith(
              petData: petDataList,
              status: SearchPageStatus.success,
              hasReachedMax: false,
            ),
          );
        }
      }

      var limit = (state.petData.length) / SearchPageRepository.perPage;

      List<PetDataModel> petDataList =
          await SearchPageRepository.petFetchInfiniteRepository(
        index: limit.ceil(),
      );

      petDataList.isEmpty
          ? emit(state.copyWith(
              hasReachedMax: true,
            ))
          : emit(
              state.copyWith(
                petData: List.of(state.petData)..addAll(petDataList),
                status: SearchPageStatus.success,
                hasReachedMax: false,
              ),
            );
    } catch (e) {
      emit(state.copyWith(status: SearchPageStatus.failure));
    }
  }
}
