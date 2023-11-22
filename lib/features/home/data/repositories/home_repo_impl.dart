import 'package:clean_arch_bookly_app/core/errors/failuer.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repositories/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepoImpl(
      {required this.homeLocalDataSource, required this.homeRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
      if (books.isNotEmpty) {
        return right(books);
      }
      books =
          await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();

      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDiorError(e));
      }
      return left(Failure(e.toString()));
    }
  }
}
