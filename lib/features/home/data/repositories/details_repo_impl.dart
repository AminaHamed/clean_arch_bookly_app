import 'package:clean_arch_bookly_app/core/errors/failuer.dart';
import 'package:clean_arch_bookly_app/features/home/data/data_sources/details_remote_data_source.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repositories/details_repo.dart';
import 'package:dartz/dartz.dart';

class DetailRepoImpl implements DetailsRepo {
  final DetailsRemoteDataSource detailsRemoteDataSource;

  DetailRepoImpl({required this.detailsRemoteDataSource});

  @override
  Future<Either<Failure, Unit>> launchBookUrl(String url) async {
    try {
      await detailsRemoteDataSource.launchBookUrl(url);
      return right(unit);
    } catch (e) {
      return left(LaunchUrlFailure(e.toString()));
    }
  }
}
