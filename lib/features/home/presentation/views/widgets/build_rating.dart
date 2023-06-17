import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_styles.dart';

class BuildRating extends StatelessWidget {
  const BuildRating({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Row(
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
          child: const Text(
            '4.8',
            style: AppStyles.textStyle16,
          ),
        ),
        SizedBox(width: deviceSize.width * 0.009),
        Text(
          '(2390)',
          style: AppStyles.textStyle14.copyWith(
            color: Colors.white.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
