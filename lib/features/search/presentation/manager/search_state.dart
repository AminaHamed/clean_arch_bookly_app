part of 'search_cubit.dart';

@immutable
abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<BookEntity> books;

  SearchSuccess(this.books);
}

class SearchFailure extends SearchState {
  final String msg;

  SearchFailure(this.msg);
}
