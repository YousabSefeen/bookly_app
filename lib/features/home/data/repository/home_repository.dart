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
  Future<Either<Failure, List<HomeModel>>> fetchNewestBooks() async {
    try {
      final result =
          await apiServices.getHomeData(endPoint: ApiConstants.newestBooks);
      List<HomeModel> newestBooks = [];

      for (var books in result['items']) {
        newestBooks.add(HomeModel.fromJson(books));
      }
      return Right(newestBooks);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<HomeModel>>> fetchProgrammingBooks() async {


    try {
      final result =
      await apiServices.getHomeData(endPoint: ApiConstants.programmingBooks);
      List<HomeModel> programmingBooks = [];

      for (var books in result['items']) {
        programmingBooks.add(HomeModel.fromJson(books));
      }
      return Right(programmingBooks);
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
