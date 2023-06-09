import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_data.dart';

class SplashWidget extends StatelessWidget {
  final Animation<Offset> slidingImage;
  final Animation<Offset> slidingText;

  const SplashWidget({
    Key? key,
    required this.slidingImage,
    required this.slidingText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
          animation: slidingImage,
          builder: (context, _) => SlideTransition(
            position: slidingImage,
            child: Image.asset(
              AssetsData.kLogo,
              width: 500,
            ),
          ),
        ),
        const SizedBox(height: 5),
        AnimatedBuilder(
          animation: slidingText,
          builder: (context, _) => SlideTransition(
            position: slidingText,
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
}
