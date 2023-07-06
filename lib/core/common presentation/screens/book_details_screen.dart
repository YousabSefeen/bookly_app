import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../features/home/presentation/views/widgets/custom_image.dart';
import '../../models/home_model.dart';
import '../../utils/app_routers.dart';
import '../../utils/app_styles.dart';
import '../widgets/book_details_actions.dart';
import '../widgets/build_rating.dart';
import '../widgets/no_image_available.dart';
import '../widgets/similar_book_list_view.dart';

class BookDetailsScreen extends StatelessWidget {
  static const route = 'BookDetailsScreen';

  const BookDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeModel = ModalRoute.of(context)!.settings.arguments as HomeModel;
    final book = homeModel.volumeInfoModel;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 27.w, top: 7.h),
          child: IconButton(
            onPressed: () => AppRouters.pop(context),
            icon: Icon(FontAwesomeIcons.x, size: 18.sp),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 27.w, top: 7.h),
            child: IconButton(
              onPressed: () {},
              icon: Icon(FontAwesomeIcons.cartShopping, size: 18.sp),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final height = constraints.maxHeight;
              return Column(
                children: [
                  SizedBox(
                    height: height * 0.38,
                    child: book.imageLinksModel?.thumbnail == null
                        ? const NoImageAvailable(
                            letterSpacing: 2,
                            heightText: 2,
                          )
                        : CustomImage(
                            imageUrl: book.imageLinksModel!.thumbnail,
                          ),
                  ),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    height: height * 0.12,
                    child: Text(
                      book.title,
                      style: AppStyles.textStyle30,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                    child: Text(
                      book.authors![0],
                      style: AppStyles.textStyle17.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.04,
                    child: BuildRating(
                      ratingsCount: book.averageRating ?? 0,
                      averageRating: book.ratingsCount ?? 0,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.1,
                    child: BookDetailsActions(
                      previewLink: book.previewLink,
                      saleability: homeModel.saleInfoModel!.saleability,
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: height * 0.07,
                    child: Text(
                      'You can also like',
                      textAlign: TextAlign.start,
                      style: AppStyles.textStyle13.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.2,
                    child: SimilarBookListView(
                        category: book.categories?[0] ?? 'computer'),
                  ),
                  SizedBox(height: height * 0.03),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
