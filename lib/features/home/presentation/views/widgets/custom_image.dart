import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_styles.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;

  const CustomImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: AspectRatio(
        aspectRatio: 2.5.w / 3.3.h,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context, _) => Center(
            child: Text(
              'Loading...',
              style: AppStyles.textStyle13.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          errorWidget: (context, s, _) => Icon(
            FontAwesomeIcons.circleExclamation,
            size: 25.sp,
          ),
        ),
      ),
    );
  }
}
