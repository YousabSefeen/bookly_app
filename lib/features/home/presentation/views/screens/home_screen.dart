import 'package:bookly/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

import '../widgets/all_books_images_list_view.dart';
import '../widgets/free_books_list_view.dart';

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
                  HomeAppBar(),
                  AllBooksImagesListView(),
                  SizedBox(height: 49),
                  Text('Free Programming Books', style: AppStyles.textStyle18),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FreeBooksListView(),
          ),
        ],
      ),
    );
  }
}
