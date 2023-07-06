import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/home_model.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<HomeModel>>> fetchProgrammingBooks();

  Future<Either<Failure, List<HomeModel>>> fetchComputerBooks();

  Future<Either<Failure, List<HomeModel>>> fetchSimilarBooks({
    required String category,
  });
}
