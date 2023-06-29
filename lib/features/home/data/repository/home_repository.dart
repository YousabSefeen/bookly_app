import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_constants.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:bookly/features/home/data/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepository implements BaseHomeRepository {
  const HomeRepository();

  @override
  Future<Either<Failure, List<HomeModel>>> fetchAllBooks() async {
    try {
      final result = await Dio(BaseOptions(baseUrl: ApiConstants.baseUrl))
          .get(ApiConstants.computerScienceBooks);
      List<HomeModel> allBooks = [];

      for (var books in result.data['items']) {
        allBooks.add(HomeModel.fromJson(books));
      }
      return Right(allBooks);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioError(error: error),
        );
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeModel>>> fetchFreeBooks() async {
    try {
      final result = await Dio(BaseOptions(baseUrl: ApiConstants.baseUrl))
          .get(ApiConstants.freeProgrammingBooks);
      List<HomeModel> freeBooks = [];

      for (var books in result.data['items']) {
        freeBooks.add(HomeModel.fromJson(books));
      }
      return Right(freeBooks);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioError(error: error),
        );
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
