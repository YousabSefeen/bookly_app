import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/features/home/presentation/views/screens/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/styles.dart';

class BestSellerListViewWidget extends StatelessWidget {
  const BestSellerListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 50,
      itemBuilder: (BuildContext context, int index) => GestureDetector(
        onTap: () {
          AppRouters.go(
            context: context,
            route: BookDetailsScreen.route,
          );
        },
        child: Container(
          // height: deviceSize.height * 0.15,
          height: deviceSize.height * 0.2,
          width: deviceSize.width * 0.87,
          margin: EdgeInsets.only(
            top: deviceSize.height * 0.030,
            left: deviceSize.width * 0.030,
            right: deviceSize.width * 0.050,
          ),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: const DecorationImage(
                      image: AssetImage(AssetsData.kMessi),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: deviceSize.width * 0.04,
                    top: deviceSize.height * 0.010,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: deviceSize.width * 0.5,
                        child: const Text(
                          'Harry Potter and the Goblet of Fire',
                          style: Styles.textStyle20a,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.01),
                      Text(
                        'J.K. Rowling',
                        style: Styles.textStyle14.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff707070),
                        ),
                      ),
                      SizedBox(height: deviceSize.height * 0.01),
                      SizedBox(
                        width: deviceSize.width * 0.58,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: '19.99',
                                style: Styles.textStyle20b,
                                children: [
                                  TextSpan(
                                    text: '€',
                                    style: Styles.textStyle15,
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            const Icon(FontAwesomeIcons.solidStar,
                                color: Color(0xffFFDD4F)),
                            Padding(
                              padding: EdgeInsets.only(
                                left: deviceSize.width * 0.02,
                                right: deviceSize.width * 0.009,
                              ),
                              child: const Text(
                                '4.8',
                                style: Styles.textStyle16,
                              ),
                            ),
                            SizedBox(width: deviceSize.width * 0.009),
                            const Text(
                              '(2390)',
                              style: Styles.textStyle14,
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
      ),
    );
  }
}
