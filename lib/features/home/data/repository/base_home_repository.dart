import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<HomeModel>>> fetchComputerBooks();

  Future<Either<Failure, List<HomeModel>>> fetchProgrammingBooks();

  Future<Either<Failure, List<HomeModel>>> fetchSimilarBooks({
    required String category,
  });
}
