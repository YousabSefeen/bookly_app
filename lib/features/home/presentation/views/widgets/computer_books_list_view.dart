import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_free_books.dart';
import 'package:bookly/features/home/presentation/controller/all%20books/computer_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/all%20books/computer_books_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/enums/request_state.dart';

class ComputerBooksListView extends StatelessWidget {
  const ComputerBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComputerBooksCubit, ComputerBooksStates>(
      buildWhen: (previous, current) =>
          previous.computerBooks != current.computerBooks,
      builder: (context, state) {
        switch (state.computerBooksState) {
          case RequestState.loading:
            return const CustomLoadingFreeBooks();
          case RequestState.loaded:
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: state.computerBooks.length,
              itemBuilder: (BuildContext context, int index) {
                return BookItem(
                  book: state.computerBooks[index].volumeInfoModel,
                );
              },
            );
          case RequestState.failure:
            return CustomErrorWidget(
              errorMessage: state.computerBooksErrorMessage,
            );
        }
      },
    );
  }
}
