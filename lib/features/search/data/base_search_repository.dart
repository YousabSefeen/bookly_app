import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/home_model.dart';
import 'package:dartz/dartz.dart';

abstract class BaseSearchRepository {
  Future<Either<Failure, List<HomeModel>>> search({required String textSearch});
}
