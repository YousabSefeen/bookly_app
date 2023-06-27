import 'package:bookly/features/home/data/repository/home_repository.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/presentation/controller/all books/all_books_cubit.dart';
import '../../features/home/presentation/controller/free books/free_books_cubit.dart';

GetIt getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton(
      () => const HomeRepository(),
    );

    getIt.registerFactory(
      () => AllBooksCubit(homeRepository: getIt()),
    );

    getIt.registerFactory(
      () => FreeBooksCubit(homeRepository: getIt()),
    );
  }
}
