import 'package:flutter/material.dart';

import 'custom_shimmer_widget.dart';

class VerticalCustomLoading extends StatelessWidget {
  const VerticalCustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 70,
      itemBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: deviceSize.height * 0.16,
        child: Row(
          children: [
            CustomShimmerWidget(
                width: deviceSize.width * 0.2, height: double.infinity),
            const SizedBox(width: 15),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.04),
                    CustomShimmerWidget(
                      width: double.infinity,
                      height: constraints.maxHeight * 0.5,
                    ),
                    CustomShimmerWidget(
                      width: double.infinity,
                      height: constraints.maxHeight * 0.17,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
