import 'package:bookly/features/home/presentation/views/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import '../widgets/best_seller_list_view_widget.dart';
import '../widgets/list_view_images_widget.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppBarWidget(),
                  ListViewImagesWidget(),
                  SizedBox(height: 35),
                  Text('Best Seller', style: Styles.textStyle18),
                  // SizedBox(height: 10),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: BestSellerListViewWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
