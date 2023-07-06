import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/presentation/controller/similar_book_details/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/similar_book_details/similar_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/home/presentation/views/widgets/custom_image.dart';
import '../../enums/request_state.dart';
import '../../utils/app_constants.dart';
import 'custom_error_widget.dart';
import 'horizontal_custom_loading.dart';

class SimilarBookListView extends StatelessWidget {
  final String category;

  const SimilarBookListView({required this.category, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SimilarBookCubit>()..fetchSimilarBooks(category: category),
      child: BlocBuilder<SimilarBookCubit, SimilarBooksStates>(
        buildWhen: (previous, current) =>
            previous.similarBooksState != current.similarBooksState,
        builder: (context, state) {
          switch (state.similarBooksState) {
            case RequestState.loading:
              return const HorizontalCustomLoading();
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
    );
  }
}
