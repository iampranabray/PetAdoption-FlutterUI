part of 'history_page_bloc.dart';

abstract class HistoryPageEvent extends Equatable {}

class FetchPetHistoryInfinitList extends HistoryPageEvent {
  FetchPetHistoryInfinitList();
  @override
  List<Object?> get props => throw UnimplementedError();
}
