import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class BaseHomeRepository {
  Future<Either<Failure, List<HomeModel>>> fetchNewestBooks();
  Future<Either<Failure, List<HomeModel>>> fetchProgrammingBooks();
}
