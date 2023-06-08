import 'package:flutter/material.dart';

import '../widgets/splash_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child:  Scaffold(
        body: SplashWidget(),
      ),
    );
  }
}
