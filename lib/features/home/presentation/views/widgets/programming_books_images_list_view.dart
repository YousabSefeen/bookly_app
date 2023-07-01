import 'package:bookly/core/utils/app_constants.dart';
import 'package:bookly/core/utils/app_routers.dart';
import 'package:bookly/core/widgets/custom_loading_all_books.dart';
import 'package:bookly/features/home/presentation/views/screens/book_details_screen.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import '../../controller/programming books/programming_books_cubit.dart';
import '../../controller/programming books/programming_books_state.dart';

class ProgrammingBooksImagesListView extends StatelessWidget {
  const ProgrammingBooksImagesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.sizeOf(context);
    return BlocBuilder<ProgrammingBooksCubit, ProgrammingBooksStates>(
      buildWhen: (previous, current) =>
          previous.programmingBooksState != current.programmingBooksState,
      builder: (context, state) {
        switch (state.programmingBooksState) {
          case RequestState.loading:
            return const CustomLoadingAllBooks();
          case RequestState.loaded:
            return SizedBox(
              height: deviceSize.height * 0.22,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.programmingBooks.length,
                itemBuilder: (BuildContext context, int index) =>
                    GestureDetector(
                  onTap: () {
                    AppRouters.go(
                      context: context,
                      route: BookDetailsScreen.route,
                      arguments: state.programmingBooks[index].volumeInfoModel,
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CustomImage(
                      imageUrl: state.programmingBooks[index].volumeInfoModel
                              .imageLinksModel?.thumbnail ??
                          AppConstants.messi,
                    ),
                  ),
                ),
              ),
            );
          case RequestState.failure:
            return CustomErrorWidget(
              errorMessage: state.programmingBooksErrorMessage,
            );
        }
      },
    );
  }
}
