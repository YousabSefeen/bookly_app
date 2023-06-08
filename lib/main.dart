import 'package:bookly/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/splash/presentation/views/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppConstants.kPrimaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}
