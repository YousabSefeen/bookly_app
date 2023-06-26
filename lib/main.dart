import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/app_routers.dart';
import 'core/utils/bloc_observer.dart';
import 'features/home/presentation/controller/all books/all_books_cubit.dart';
import 'features/home/presentation/controller/free books/free_books_cubit.dart';
import 'features/splash/presentation/views/screens/splash_screen.dart';

void main() {
  // runApp(
  //   DevicePreview(
  //     builder: (BuildContext context) => const MyApp(),
  //   ),
  // );

  Bloc.observer = MyBlocObserver();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, _) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<AllBooksCubit>()..fetchAllBooks(),
          ),
          BlocProvider(
            create: (context) => getIt<FreeBooksCubit>()..fetchFreeBooks(),
          ),
        ],
        child: MaterialApp(
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
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
      ),
    );
  }
}
