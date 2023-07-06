import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_constants.dart';
import 'package:bookly/features/home/data/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/models/home_model.dart';

class HomeRepository implements BaseHomeRepository {
  const HomeRepository();

  @override
  Future<Either<Failure, List<HomeModel>>> fetchProgrammingBooks() async {
    try {
      final response = await Dio(BaseOptions(baseUrl: ApiConstants.baseUrl))
          .get(ApiConstants.programmingBooks);
      List<HomeModel> freeBooks = [];

      for (var books in response.data['items']) {
        freeBooks.add(HomeModel.fromJson(books));
      }
      return Right(freeBooks);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(error: error),
        );
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeModel>>> fetchComputerBooks() async {
    try {
      final response = await Dio(BaseOptions(baseUrl: ApiConstants.baseUrl))
          .get(ApiConstants.computerBooks);
      List<HomeModel> allBooks = [];

      for (var books in response.data['items']) {
        allBooks.add(HomeModel.fromJson(books));
      }
      return Right(allBooks);
    } catch (error) {
      if (error is DioException) {
        return Left(
          ServerFailure.fromDioException(error: error),
        );
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeModel>>> fetchSimilarBooks({
    required String category,
  }) async {
    try {
      final response = await Dio(
        BaseOptions(baseUrl: ApiConstants.baseUrl),
      ).get(ApiConstants.getSimilar(category));

      List<HomeModel> similarBooks = [];
      for (var book in response.data['items']) {
        try {
          similarBooks.add(HomeModel.fromJson(book));
        } catch (e) {
          similarBooks.add(HomeModel.fromJson(book));
        }
      }
      return Right(similarBooks);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error: error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
