import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/features/home/presentation/views/screens/book_details_screen.dart';
import 'package:bookly/features/home/presentation/views/widgets/build_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 20),
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          AppRouters.go(
            context: context,
            route: BookDetailsScreen.route,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 30, right: 51),
          child: Row(
            children: [
              SizedBox(
                width: deviceSize.width * 0.2,
                child: const CustomImage(),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: deviceSize.width * 0.5,
                        child: const Text(
                          'Harry Potter and the Goblet of Fire',
                          style: AppStyles.textStyle20a,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.01),
                      Text(
                        'J.K. Rowling',
                        style: AppStyles.textStyle14.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.01),
                      SizedBox(
                        width: deviceSize.width * 0.58,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: '19.99',
                                style: AppStyles.textStyle20b,
                                children: [
                                  TextSpan(
                                    text: '€',
                                    style: AppStyles.textStyle15,
                                  ),
                                ],
                              ),
                            ),
                            const BuildRating(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
