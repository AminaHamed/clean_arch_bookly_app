part of 'newest_books_cubit.dart';

@immutable
abstract class NewestBooksState {}

class NewestBooksInitial extends NewestBooksState {}

class NewestBooksLoading extends NewestBooksState {}

class NewestBooksFailure extends NewestBooksState {
  final String msg;

  NewestBooksFailure(this.msg);
}

class NewestBooksSuccess extends NewestBooksState {
  final List<BookEntity> books;

  NewestBooksSuccess(this.books);
}
