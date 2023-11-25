import 'package:clean_arch_bookly_app/core/errors/failuer.dart';
import 'package:clean_arch_bookly_app/core/use_cases/use_cases.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/domain/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase implements UseCase<List<BookEntity>, String> {
  final SearchRepo searchRepo;

  SearchUseCase({required this.searchRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(String keyWord) async {
    return await searchRepo.search(keyWord);
  }
}
