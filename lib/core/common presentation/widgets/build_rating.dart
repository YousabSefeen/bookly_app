import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_styles.dart';

class BuildRating extends StatelessWidget {
  final num averageRating;
  final num ratingsCount;

  const BuildRating(
      {required this.averageRating, required this.ratingsCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 2.w),
        Icon(
          FontAwesomeIcons.solidStar,
          color: const Color(0xffFFDD4F),
          size: 14.sp,
        ),
        SizedBox(width: 4.w),
        Text(
          '( $averageRating )',
          style: AppStyles.textStyle13.copyWith(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 2.w),
        Text(
          ratingsCount.toString(),
          style: AppStyles.textStyle13,
        ),
      ],
    );
  }
}
