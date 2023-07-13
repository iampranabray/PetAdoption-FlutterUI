part of 'search_page_bloc.dart';

abstract class SearchPageEvent extends Equatable {}

class SearchPet extends SearchPageEvent {
  final String searchText;
  SearchPet({this.searchText = ''});
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SearchPetInfinite extends SearchPageEvent {
  final String searchText;

  SearchPetInfinite({this.searchText = ''});
  @override
  List<Object?> get props => throw UnimplementedError();
}
