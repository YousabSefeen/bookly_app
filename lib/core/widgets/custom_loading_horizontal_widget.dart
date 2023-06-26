import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingHorizontalWidget extends StatelessWidget {
  const CustomLoadingHorizontalWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 25,
          itemBuilder: (context, index) => Shimmer.fromColors(
            baseColor: Colors.grey[850]!,
            highlightColor: Colors.grey[800]!,
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              width: 110,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ));
  }
}
