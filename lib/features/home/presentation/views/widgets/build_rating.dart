import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_styles.dart';

class BuildRating extends StatelessWidget {
  final num rating;
  final num ratingsCount;

  const BuildRating(
      {required this.rating, required this.ratingsCount, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        Padding(
          padding: EdgeInsets.only(
            left: deviceSize.width * 0.02,
            right: deviceSize.width * 0.009,
          ),
          child: Text(
            ratingsCount.toString(),
            style: AppStyles.textStyle16,
          ),
        ),
        SizedBox(width: deviceSize.width * 0.009),
        Text(
          '( $rating )',
          style: AppStyles.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
