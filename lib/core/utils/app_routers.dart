import 'package:bookly/features/home/presentation/views/screens/home_screen.dart';
import 'package:bookly/main.dart';
import 'package:flutter/cupertino.dart';

import '../common presentation/screens/book_details_screen.dart';

abstract class AppRouters {
  static Map<String, Widget Function(BuildContext)> routers = {
    HomeScreen.route: (context) => const HomeScreen(),
    BookDetailsScreen.route: (context) => const BookDetailsScreen(),
    MyApp.route: (context) => const MyApp(),
  };

  static go({
    required BuildContext context,
    required String route,
    Object? arguments,
  }) {
    Navigator.of(context).pushNamed(route, arguments: arguments);
  }

  static pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static goAndReplacement({
    required BuildContext context,
    required String route,
    Object? arguments,
  }) {
    Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
  }
}
