import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_data.dart';

class CustomListViewImages extends StatelessWidget {
  const CustomListViewImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      height: deviceSize.height * 0.3,
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: const DecorationImage(
              image: AssetImage(AssetsData.kMessi),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
