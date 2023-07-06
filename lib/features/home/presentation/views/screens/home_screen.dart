import 'package:bookly/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_styles.dart';
import '../widgets/computer_books_list_view.dart';
import '../widgets/programming_books_images_list_view.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'HomeScreen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeAppBar(),
                    const ProgrammingBooksImagesListView(),
                    SizedBox(height: 30.h),
                    Text('Computer Science Books',
                        style: AppStyles.textStyle17),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: ComputerBooksListView(),
            ),
          ],
        ),
      ),
    );
  }
}
