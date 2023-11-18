import 'package:clean_arch_bookly_app/core/errors/failuer.dart';
import 'package:clean_arch_bookly_app/core/use_cases/use_cases.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchNewestBooksUseCase implements UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchNewestBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(NoParam param) async {
    return await homeRepo.fetchNewestBooks();
  }
}
