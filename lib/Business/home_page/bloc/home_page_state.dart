part of 'home_page_bloc.dart';

enum HomePageStatus { initial, success, failure }

class HomePageState extends Equatable {
  final bool hasReachedMax;
  final HomePageStatus status;
  final List<PetDataModel> petData;

  const HomePageState(
      {this.petData = const <PetDataModel>[],
      this.hasReachedMax = false,
      this.status = HomePageStatus.initial});

  HomePageState copyWith(
      {petData, bool? hasReachedMax, HomePageStatus? status}) {
    return HomePageState(
        petData: petData ?? this.petData,
        hasReachedMax: hasReachedMax ?? this.hasReachedMax,
        status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status, petData, hasReachedMax];
}
