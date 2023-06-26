import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/features/home/presentation/views/screens/home_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/splash_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<Offset> _slidingImage;
  late Animation<Offset> _slidingText;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigatorToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SplashWidget(
          slidingImage: _slidingImage,
          slidingText: _slidingText,
        ),
      ),
    );
  }

  void initAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _slidingText = Tween<Offset>(
      begin: const Offset(0, 7),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInQuint));

    _slidingImage = Tween<Offset>(
      begin: const Offset(0, -4),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInQuint));
    _animationController.forward();
  }

  void navigatorToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () => AppRouters.goAndReplacement(
        context: context,
        route: HomeScreen.route,
      ),
    );
  }
}
