import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.featuredBooksUseCase) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featuredBooksUseCase.call(pageNumber);
    result.fold((failure) {
      if (pageNumber == 0) {
        return emit(FeaturedBooksFailure(failure.msg));
      } else {
        return emit(FeaturedBooksPaginationFailure(failure.msg));
      }
    }, (books) {
      return emit(FeaturedBooksSuccess(books));
    });
  }
}