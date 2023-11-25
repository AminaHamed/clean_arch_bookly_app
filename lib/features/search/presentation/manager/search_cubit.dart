import 'package:bloc/bloc.dart';
import 'package:clean_arch_bookly_app/features/search/domain/use_cases/search_use_case.dart';
import 'package:meta/meta.dart';

import '../../../home/domain/entities/book_entity.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchUseCase) : super(SearchInitial());
  final SearchUseCase searchUseCase;

  Future<void> search(String keyWord) async {
    emit(SearchLoading());
    var result = await searchUseCase.call(keyWord);
    result.fold((failure) => emit(SearchFailure(failure.msg)),
        (books) => emit(SearchSuccess(books)));
  }
}
