import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_constants.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:bookly/features/home/data/repository/base_home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepository implements BaseHomeRepository {
  final ApiServices apiServices;

  HomeRepository({required this.apiServices});

  @override
  Future<Either<Failure, List<HomeModel>>> fetchAllBooks() async {
    try {
      final result =
          await apiServices.getHomeData(endPoint: ApiConstants.allBooks);
      List<HomeModel> allBooks = [];

      for (var books in result['items']) {
        allBooks.add(HomeModel.fromJson(books));
      }
      return Right(allBooks);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeModel>>> fetchFreeBooks() async {
    try {
      final result =
          await apiServices.getHomeData(endPoint: ApiConstants.freeBooks);
      List<HomeModel> freeBooks = [];

      for (var books in result['items']) {
        freeBooks.add(HomeModel.fromJson(books));
      }
      return Right(freeBooks);
    } catch (error) {
      print('fitchProgrammingBooks');
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
