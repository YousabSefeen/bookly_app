import 'package:bookly/core/widgets/no_image_available.dart';
import 'package:bookly/features/home/data/models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/app_styles.dart';
import '../widgets/book_details_actions.dart';
import '../widgets/build_rating.dart';
import '../widgets/custom_image.dart';
import '../widgets/similar_book_list_view.dart';

class BookDetailsScreen extends StatelessWidget {
  static const route = 'BookDetailsScreen';

  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);
    final homeModel = ModalRoute.of(context)!.settings.arguments as HomeModel;
    final book = homeModel.volumeInfoModel;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 30.0, top: 20),
            child: IconButton(
              onPressed: () => AppRouters.pop(context),
              icon: const Icon(FontAwesomeIcons.x, size: 20),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30.0, top: 20),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.cartShopping, size: 20),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 30,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: deviceSize.height * 0.3,
                    child: book.imageLinksModel?.thumbnail == null
                        ? const NoImageAvailable(
                            letterSpacing: 2,
                            heightText: 2,
                          )
                        : CustomImage(
                            imageUrl: book.imageLinksModel!.thumbnail,
                          ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    book.title,
                    style: AppStyles.textStyle30,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    book.authors![0],
                    style: AppStyles.textStyle18.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 10),
                  BuildRating(
                    ratingsCount: book.averageRating ?? 0,
                    rating: book.ratingsCount ?? 0,
                  ),
                  const SizedBox(height: 27),
                  BookDetailsActions(
                    previewLink: book.previewLink,
                    saleability: homeModel.saleInfoModel!.saleability,
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'You can also like',
                      textAlign: TextAlign.start,
                      style: AppStyles.textStyle14.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SimilarBookListView(
                      category: book.categories?[0] ?? 'computer'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
