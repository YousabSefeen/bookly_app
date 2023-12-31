import 'package:bookly/core/check%20internet/controller/check_internet_cubit.dart';
import 'package:bookly/features/home/data/repository/home_repository.dart';
import 'package:bookly/features/home/presentation/controller/similar_book_details/similar_books_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/presentation/controller/all books/computer_books_cubit.dart';
import '../../features/home/presentation/controller/programming books/programming_books_cubit.dart';
import '../../features/search/data/search_repository.dart';
import '../../features/search/presentation/controller/search_cubit.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton(
      () => const HomeRepository(),
    );

    getIt.registerFactory(
      () => ProgrammingBooksCubit(homeRepository: getIt()),
    );
    getIt.registerFactory(
      () => ComputerBooksCubit(homeRepository: getIt()),
    );

    getIt.registerFactory(
      () => SimilarBookCubit(homeRepository: getIt()),
    );

    getIt.registerLazySingleton(
      () => SearchRepository(),
    );

    getIt.registerFactory(
      () => SearchCubit(searchRepository: getIt()),
    );
    getIt.registerFactory(
      () => CheckInternetCubit(),
    );
  }
}
