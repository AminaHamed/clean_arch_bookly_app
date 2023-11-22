import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/core/use_cases/use_cases.dart';
import 'package:clean_arch_bookly_app/features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/book_entity.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.fetchNewestBooksUseCase) : super(NewestBooksInitial());
  final FetchNewestBooksUseCase fetchNewestBooksUseCase;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await fetchNewestBooksUseCase.call(NoParam());
    result.fold((failure) {
      emit(NewestBooksFailure(failure.msg));
    }, (books) {
      emit(NewestBooksSuccess(books));
    });
  }
}
