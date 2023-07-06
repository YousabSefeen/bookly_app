import 'package:bookly/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../search/presentation/views/screens/search_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);

    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppConstants.kLogo,
            width: deviceSize.width * 0.25,
            height: deviceSize.height * 0.1,
          ),
          IconButton(
            onPressed: () =>
                AppRouters.go(context: context, route: SearchScreen.route),
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22.sp,
            ),
          ),
        ],
      ),
    );
  }
}
