import 'package:bookly/features/home/presentation/views/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../features/home/presentation/views/screens/book_details_screen.dart';

abstract class AppRouters {
  static Map<String, Widget Function(BuildContext)> routers = {
    HomeScreen.route: (context) => const HomeScreen(),
    BookDetailsScreen.route: (context) => const BookDetailsScreen(),
  };

  static go({
    required BuildContext context,
    required String route,
    Object? arguments,
  }) {
    Navigator.of(context).pushNamed(route, arguments: arguments);
  }

  static goAndReplacement({
    required BuildContext context,
    required String route,
    Object? arguments,
  }) {
    Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
  }
}
