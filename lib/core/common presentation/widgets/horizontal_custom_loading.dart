import 'package:flutter/material.dart';

import 'custom_shimmer_widget.dart';

class HorizontalCustomLoading extends StatelessWidget {
  const HorizontalCustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 25,
          itemBuilder: (context, index) =>
              const CustomShimmerWidget(width: 115, height: 150),
        ));
  }
}
