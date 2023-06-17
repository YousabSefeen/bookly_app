import 'package:flutter/material.dart';

import 'custom_image.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) => const Padding(
        padding: EdgeInsets.only(right: 10),
        child: CustomImage(),
      ),
    );
  }
}
