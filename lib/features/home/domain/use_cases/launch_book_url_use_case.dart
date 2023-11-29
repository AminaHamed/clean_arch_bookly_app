import 'package:clean_arch_bookly_app/core/errors/failuer.dart';
import 'package:clean_arch_bookly_app/core/use_cases/use_cases.dart';
import 'package:clean_arch_bookly_app/features/home/domain/repositories/details_repo.dart';
import 'package:dartz/dartz.dart';

class LaunchBookUrlUseCase implements UseCase<Unit, String> {
  final DetailsRepo detailsRepo;

  LaunchBookUrlUseCase({required this.detailsRepo});

  @override
  Future<Either<Failure, Unit>> call(String url) async {
    return await detailsRepo.launchBookUrl(url);
  }
}
