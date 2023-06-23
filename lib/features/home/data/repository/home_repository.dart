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
  Future<Either<Failure, List<HomeModel>>> getHomeData() async {
    try {
      final result =
          await apiServices.getHomeData(endPoint: ApiConstants.endPoint);
      List<HomeModel> books = [];

      for (var item in result['items']) {
        books.add(HomeModel.fromJson(item));
      }
      return Right(books);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioError(error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
