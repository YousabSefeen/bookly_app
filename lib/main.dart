import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/check internet/check_internet.dart';
import 'core/check internet/no_internet_connection_screen.dart';
import 'core/utils/app_routers.dart';
import 'core/utils/bloc_observer.dart';
import 'features/home/presentation/controller/all books/computer_books_cubit.dart';
import 'features/home/presentation/controller/programming books/programming_books_cubit.dart';
import 'features/splash/presentation/views/screens/splash_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const route = 'MyApp';

  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /// The following code is for checking the internet connection
  Map _source = {ConnectivityResult.none: false};
  final MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    _connectivity.initialise();
    _connectivity.myStream.listen((source) {
      setState(() => _source = source);
    });
  }

  @override
  void dispose() {
    _connectivity.disposeStream();
    super.dispose();
  }

  late Widget home;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) {
        switch (_source.keys.toList()[0]) {
          case ConnectivityResult.mobile:
            home = const SplashScreen();
            break;
          case ConnectivityResult.wifi:
            home = const SplashScreen();
            break;
          case ConnectivityResult.none:
          default:
            home = const NoInternetConnectionScreen();
        }

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
            home: home,
            routes: AppRouters.routers,
          ),
        );
      },
    );
  }
}
