import 'package:bookly/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.3 / 3.5,
      child: Container(
        decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(AppAssets.kMessi),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
