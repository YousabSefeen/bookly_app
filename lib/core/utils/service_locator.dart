import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/repository/home_repository.dart';
import 'package:bookly/features/home/presentation/controller/newest%20books/home_cubit.dart';
import 'package:bookly/features/home/presentation/controller/programming%20books/programming_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton(
      () => HomeRepository(
        apiServices: getIt(),
      ),
    );

    getIt.registerLazySingleton(() => ApiServices(Dio()));

    getIt.registerFactory(
      () => ProgrammingBooksCubit(homeRepository: getIt()),
    );

    getIt.registerFactory(
      () => NewestBooksCubit(homeRepository: getIt()),
    );
  }
}
