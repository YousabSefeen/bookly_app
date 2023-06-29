import 'package:bookly/features/home/presentation/views/widgets/similar_book_list_view.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_styles.dart';
import 'book_details_actions.dart';
import 'build_rating.dart';
import 'custom_image.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 30,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) => Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.3,
              margin: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.22),
              child: const CustomImage(
                imageUrl: AppConstants.messi,
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
              height: constraints.maxHeight * 0.06,
              child:
                  const Text('The Jungle Book', style: AppStyles.textStyle30),
            ),
            SizedBox(height: constraints.maxHeight * 0.01),
            SizedBox(
              height: constraints.maxHeight * 0.04,
              child: Text(
                'Rudyard Kipling',
                style: AppStyles.textStyle18.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.02),
            SizedBox(
              height: constraints.maxHeight * 0.04,
              child: const BuildRating(
                rating: 5,
                ratingsCount: 10,
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            SizedBox(
              height: constraints.maxHeight * 0.08,
              child: const BookDetailsActions(),
            ),
            Container(
              height: constraints.maxHeight * 0.05,
              margin: const EdgeInsets.only(top: 39, bottom: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also like',
                  textAlign: TextAlign.start,
                  style: AppStyles.textStyle14.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            const Expanded(
              child: SimilarBookListView(),
            ),
          ],
        ),
      ),
    );
  }
}
