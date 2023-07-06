import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_styles.dart';

class NoImageAvailable extends StatelessWidget {
  final double? letterSpacing;
  final double? heightText;

  const NoImageAvailable({this.letterSpacing, this.heightText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.5.w / 3.3.h,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.red.shade900,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Image\n Not Available',
            style: AppStyles.textStyle13
                .copyWith(height: heightText, letterSpacing: letterSpacing),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
