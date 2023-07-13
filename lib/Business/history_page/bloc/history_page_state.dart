part of 'history_page_bloc.dart';

enum HistoryPageStatus { initial, success, failure }

class HistoryPageState extends Equatable {
  final bool hasReachedMax;
  final HistoryPageStatus status;
  final List<PetDataModel> petData;

  const HistoryPageState(
      {this.petData = const <PetDataModel>[],
      this.hasReachedMax = false,
      this.status = HistoryPageStatus.initial});

  HistoryPageState copyWith(
      {petData, bool? hasReachedMax, HistoryPageStatus? status}) {
    return HistoryPageState(
        petData: petData ?? this.petData,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status, petData, hasReachedMax];
}
