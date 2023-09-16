import 'package:bookly/core/check%20internet/controller/check_internet_cubit.dart';
import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/splash/presentation/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/app_routers.dart';
import 'core/utils/bloc_observer.dart';
import 'features/home/presentation/controller/all books/computer_books_cubit.dart';
import 'features/home/presentation/controller/programming books/programming_books_cubit.dart';
import 'features/search/presentation/controller/search_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Bloc.observer = MyBlocObserver();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const route = 'MyApp';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  getIt<ProgrammingBooksCubit>()..fetchProgrammingBooks(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<ComputerBooksCubit>()..fetchComputerBooks(),
            ),
            BlocProvider(
              create: (context) => getIt<SearchCubit>(),
            ),
            BlocProvider(
              create: (context) =>
                  getIt<CheckInternetCubit>()..checkInternetConnection(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              appBarTheme: const AppBarTheme(
                color: AppConstants.kPrimaryColor,
              ),
              scaffoldBackgroundColor: AppConstants.kPrimaryColor,
              textTheme:
                  GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
            ),
            home: const SplashScreen(),
            routes: AppRouters.routers,
          ),
        );
      },
    );
  }
}
