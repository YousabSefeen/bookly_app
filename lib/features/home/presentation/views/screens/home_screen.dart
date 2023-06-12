import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets_data.dart';
import '../../../../../core/utils/styles.dart';
import '../widgets/custom_list_view_images.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: deviceSize.width * 0.05),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            CustomListViewImages(),
            SizedBox(height: 45),
            Text('Best Seller', style: Styles.textStyle18),
            BestSellerListView()
          ],
        ),
      ),
    );
  }
}

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.red,
      width: deviceSize.width * 0.9,
      height: deviceSize.height * 0.17,
      child: Row(
        children: [
          SizedBox(
            child: AspectRatio(
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
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                // Text(
                //   'More than a convening of big thinkers and chance meetings, the Aspen Ideas Festiva',
                //   maxLines: 2,
                //   overflow: TextOverflow.ellipsis,
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
