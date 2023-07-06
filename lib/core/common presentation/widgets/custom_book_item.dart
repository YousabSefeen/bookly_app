import 'package:bookly/core/models/home_model.dart';
import 'package:flutter/material.dart';

import '../../../features/home/presentation/views/widgets/custom_image.dart';
import '../../utils/app_routers.dart';
import '../../utils/app_styles.dart';
import '../screens/book_details_screen.dart';
import 'build_rating.dart';
import 'no_image_available.dart';

class CustomBookItem extends StatelessWidget {
  final HomeModel homeModel;

  const CustomBookItem({required this.homeModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    final bookInfo = homeModel.volumeInfoModel;
    return SizedBox(
      height: deviceSize.height * 0.16,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, left: 30, right: 51),
        child: GestureDetector(
          onTap: () => AppRouters.go(
            context: context,
            route: BookDetailsScreen.route,
            arguments: homeModel,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                children: [
                  SizedBox(
                    width: deviceSize.width * 0.2,
                    child: bookInfo.imageLinksModel?.thumbnail == null
                        ? const NoImageAvailable(
                            heightText: 1.5,
                          )
                        : CustomImage(
                            imageUrl: bookInfo.imageLinksModel!.thumbnail),
                  ),

                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: constraints.maxHeight * 0.04),
                        SizedBox(
                          height: constraints.maxHeight * 0.5,
                          child: Text(
                            bookInfo.title,
                            style: AppStyles.textStyle18a,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.17,
                          child: Text(
                            bookInfo.authors![0],
                            style: AppStyles.textStyle13.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.29,
                          child: LayoutBuilder(
                            builder: (context, constraints) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: constraints.maxWidth * 0.6,
                                  child: Text(
                                    getSaleability(
                                      homeModel.saleInfoModel!.saleability,
                                    ),
                                    style: AppStyles.textStyle13,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.4,
                                  child: BuildRating(
                                    averageRating: bookInfo.averageRating ?? 0,
                                    ratingsCount: bookInfo.ratingsCount ?? 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //0.8
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  String getSaleability(String saleability) {
    if (saleability == 'NOT_FOR_SALE') {
      return 'Not FOR SALE';
    } else {
      return 'FOR SALE';
    }
  }
}
