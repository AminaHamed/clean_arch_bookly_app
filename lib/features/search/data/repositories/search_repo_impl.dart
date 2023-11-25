import 'package:clean_arch_bookly_app/core/errors/failuer.dart';
import 'package:clean_arch_bookly_app/features/home/domain/entities/book_entity.dart';
import 'package:clean_arch_bookly_app/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/search/domain/repositories/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/network/network_info.dart';

class SearchRpoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final NetworkInfo networkInfo;

  SearchRpoImpl(
      {required this.searchRemoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<BookEntity>>> search(String keyWord) async {
    if (await networkInfo.isConnected) {
      try {
        List<BookEntity> books = await searchRemoteDataSource.search(keyWord);
        return Right(books);
      } catch (e) {
        if (e is DioError) {
          return left(ServerFailure.fromDiorError(e));
        }
        return left(Failure(e.toString()));
      }
    } else {
      return left(NetworkFailure('No Internet Connection'));
    }
  }
}
