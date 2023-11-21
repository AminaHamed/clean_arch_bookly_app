import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/core/use_cases/use_cases.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await featuredBooksUseCase.call(NoParam());
    result.fold((failure) {
      FeaturedBooksFailure(failure.msg);
    }, (books) {
      FeaturedBooksSuccess(books);
    });
  }
}
