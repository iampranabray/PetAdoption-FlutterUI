part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {}

class FetchPetInfinitList extends HomePageEvent {
  FetchPetInfinitList();
  @override
  List<Object?> get props => throw UnimplementedError();
}

class AdoptPet extends HomePageEvent {
  final String? id;
  AdoptPet({this.id = ''});
  @override
  List<Object?> get props => throw UnimplementedError();
}
