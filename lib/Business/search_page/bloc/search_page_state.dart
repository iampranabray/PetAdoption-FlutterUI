part of 'search_page_bloc.dart';

enum SearchPageStatus { initial, success, failure }

class SearchPageState extends Equatable {
  final bool hasReachedMax;
  final SearchPageStatus status;
  final List<PetDataModel> petData;

  const SearchPageState(
      {this.petData = const <PetDataModel>[],
      this.hasReachedMax = false,
      this.status = SearchPageStatus.initial});

  SearchPageState copyWith(
      {petData, bool? hasReachedMax, SearchPageStatus? status}) {
    return SearchPageState(
        petData: petData ?? this.petData,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status, petData, hasReachedMax];
}
