import 'package:bookly/core/widgets/custom_shimmer_widget.dart';
import 'package:flutter/material.dart';

class CustomLoadingFreeBooks extends StatelessWidget {
  const CustomLoadingFreeBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 70,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 125,
        child: Row(
          children: [
            CustomShimmerWidget(width: deviceSize.width * 0.2, height: 150),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomShimmerWidget(
                    width: deviceSize.width * 0.6,
                    height: 70,
                  ),
                  CustomShimmerWidget(
                    width: deviceSize.width * 0.6,
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
