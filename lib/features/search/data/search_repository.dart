import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/home_model.dart';
import 'package:bookly/core/utils/api_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'base_search_repository.dart';

class SearchRepository implements BaseSearchRepository {
  @override
  Future<Either<Failure, List<HomeModel>>> search(
      {required String textSearch}) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: ApiConstants.baseUrl))
          .get(ApiConstants.search(textSearch));

      List<HomeModel> books = [];
      for (var book in response.data['items']) {
        books.add(HomeModel.fromJson(book));
      }
      return Right(books);
    } catch (error) {
      if (error is DioException) {
        return Left(ServerFailure.fromDioException(error: error));
      } else {
        return Left(ServerFailure(error.toString()));
      }
    }
  }
}
