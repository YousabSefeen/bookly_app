import 'package:bookly/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/models/volume_info_model.dart';
import '../screens/book_details_screen.dart';
import 'build_rating.dart';
import 'custom_image.dart';

class FreeBookItem extends StatelessWidget {
  final VolumeInfoModel book;

  const FreeBookItem({required this.book, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);
    return GestureDetector(
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
              child: CustomImage(
                  imageUrl:
                      book.imageLinksModel?.thumbnail ?? AppConstants.messi),
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
                      child: Text(
                        book.title,
                        style: AppStyles.textStyle20a,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: deviceSize.height * 0.01),
                    Text(
                      book.authors[0],
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
                          const Text(
                            'Free',
                            style: AppStyles.textStyle20b,
                          ),
                          BuildRating(
                            rating: book.averageRating ?? 0,
                            ratingsCount: book.ratingsCount ?? 0,
                          ),
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
    );
  }
}
