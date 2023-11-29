import 'package:dartz/dartz.dart';

import '../../../../core/errors/failuer.dart';

abstract class DetailsRepo {
  Future<Either<Failure, Unit>> launchBookUrl(String url);
}
