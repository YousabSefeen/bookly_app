import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;

  const CustomImage({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.3 / 3.5,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
