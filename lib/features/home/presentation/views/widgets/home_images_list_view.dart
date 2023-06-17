import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

class HomeImagesListView extends StatelessWidget {
  const HomeImagesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      height: deviceSize.height * 0.22,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => const Padding(
          padding: EdgeInsets.only(right: 10),
          child: CustomImage(),
        ),
      ),
    );
  }
}
