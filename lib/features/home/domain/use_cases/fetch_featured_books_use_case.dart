import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';
import '../../../../core/use_cases/use_cases.dart';
import '../entities/book_entity.dart';
import '../repositories/home_repo.dart';

class FetchFeaturedBooksUseCase implements UseCase<List<BookEntity>, NoParam> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookEntity>>> call(NoParam param) async {
    //permission
    return await homeRepo.fetchFeaturedBooks();
  }
}
