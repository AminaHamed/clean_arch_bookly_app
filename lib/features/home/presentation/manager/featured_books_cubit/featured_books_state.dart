part of 'featured_books_cubit.dart';

@immutable
abstract class FeaturedBooksState {}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationLoading extends FeaturedBooksState {}

class FeaturedBooksPaginationFailure extends FeaturedBooksState {
  final String msg;

  FeaturedBooksPaginationFailure(this.msg);
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String msg;

  FeaturedBooksFailure(this.msg);
}

class FeaturedBooksSuccess extends FeaturedBooksState {
  final List<BookEntity> books;

  FeaturedBooksSuccess(this.books);
}
