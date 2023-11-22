import 'package:clean_arch_bookly_app/core/errors/failuer.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});

  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks();
}
