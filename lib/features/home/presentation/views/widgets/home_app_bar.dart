import 'package:bookly/core/utils/app_assets.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../search/presentation/views/screens/search_screen.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            AppAssets.kLogo,
            width: deviceSize.width * 0.25,
            height: deviceSize.height * 0.12,
          ),
          IconButton(
            onPressed: () =>
                AppRouters.go(context: context, route: SearchScreen.route),
            icon: Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: deviceSize.width * 0.06,
            ),
          ),
        ],
      ),
    );
  }
}
