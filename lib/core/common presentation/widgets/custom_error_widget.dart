import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../main.dart';
import '../../utils/app_routers.dart';
import '../../utils/app_styles.dart';
import 'custom_button.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CustomErrorWidget({required this.errorMessage, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              FontAwesomeIcons.circleExclamation,
              size: 25.sp,
              color: Colors.red,
            ),
            title: Text(
              errorMessage,
              style: AppStyles.textStyle17.copyWith(
                color: Colors.black,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 35.h,
            child: CustomButton(
              borderRadius: BorderRadius.circular(80.sp),
              backgroundColor: Colors.red,
              text: 'Refresh',
              onPressed: () =>
                  AppRouters.go(context: context, route: MyApp.route),
            ),
          )
        ],
      ),
    );
  }
}
