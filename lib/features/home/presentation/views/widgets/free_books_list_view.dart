import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_free_books.dart';
import 'package:bookly/features/home/presentation/controller/free%20books/free_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/free%20books/free_books_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/free_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/request_state.dart';

class FreeBooksListView extends StatelessWidget {
  const FreeBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<FreeBooksCubit, FreeBooksStates>(
      buildWhen: (previous, current) =>
          previous.freeBooksState != current.freeBooksState,
      builder: (context, state) {
        switch (state.freeBooksState) {
          case RequestState.loading:
            return const CustomLoadingFreeBooks();
          case RequestState.loaded:
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: state.freeBooks.length,
              itemBuilder: (BuildContext context, int index) {
                return FreeBookItem(
                  book: state.freeBooks[index].volumeInfoModel,
                );
              },
            );
          case RequestState.failure:
            return CustomErrorWidget(
              errorMessage: state.freeBooksErrorMessage,
            );
        }
      },
    );
  }
}
