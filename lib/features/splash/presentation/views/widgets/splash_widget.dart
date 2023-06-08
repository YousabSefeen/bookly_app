import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget>
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: _slidingImage,
          builder: (context, _) => SlideTransition(
            position: _slidingImage,
            child: Image.asset(
              AppConstants.kLogo,
              width: 500,
            ),
          ),
        ),
        const SizedBox(height: 5),
        AnimatedBuilder(
          animation: _slidingText,
          builder: (context, _) => SlideTransition(
            position: _slidingText,
            child: const Text(
              'Read Free Books',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ],
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
      const Duration(seconds: 3),
      () => Get.to(
        () => const HomeView(),
        duration: AppConstants.kTransitionDuration,
        transition: Transition.fade,
      ),
    );
  }
}
