import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: AspectRatio(
                aspectRatio: 2.w / 0.5.h,
                child: Image.asset(
                  AppConstants.kLogo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 15.h),
        AnimatedBuilder(
          animation: slidingText,
          builder: (context, _) => SlideTransition(
            position: slidingText,
            child: Text(
              'Read Free Books',
              textAlign: TextAlign.center,
              style: AppStyles.textStyle17.copyWith(
                letterSpacing: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
