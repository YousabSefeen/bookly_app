import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/controller/similar_book_details/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/similar_book_details/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/request_state.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/widgets/custom_loading_all_books.dart';
import 'custom_image.dart';

class SimilarBookListView extends StatelessWidget {
  final String category;

  const SimilarBookListView({required this.category, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.sizeOf(context);
    return SizedBox(
      height: deviceSize.height * 0.17,
      child: BlocProvider(
        create: (context) =>
            getIt<SimilarBookCubit>()..fetchSimilarBooks(category: category),
        child: BlocBuilder<SimilarBookCubit, SimilarBooksStates>(
          buildWhen: (previous, current) =>
              previous.similarBooksState != current.similarBooksState,
          builder: (context, state) {
            switch (state.similarBooksState) {
              case RequestState.loading:
                return const CustomLoadingAllBooks();
              case RequestState.loaded:
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.similarBooks.length,
                  itemBuilder: (BuildContext context, int index) {
                    final book = state.similarBooks[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CustomImage(
                          imageUrl:
                              book.volumeInfoModel.imageLinksModel?.thumbnail ??
                                  AppConstants.messi),
                    );
                  },
                );
              case RequestState.failure:
                return CustomErrorWidget(
                    errorMessage: state.similarBooksErrorMessage);
            }
          },
        ),
      ),
    );
  }
}
