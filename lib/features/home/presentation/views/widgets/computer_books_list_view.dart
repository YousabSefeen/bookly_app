import 'package:bookly/features/home/presentation/controller/all%20books/computer_books_cubit.dart';
import 'package:bookly/features/home/presentation/controller/all%20books/computer_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common presentation/widgets/custom_book_item.dart';
import '../../../../../core/common presentation/widgets/custom_error_widget.dart';
import '../../../../../core/common presentation/widgets/vertical_custom_loading.dart';
import '../../../../../core/enums/request_state.dart';

class ComputerBooksListView extends StatelessWidget {
  const ComputerBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComputerBooksCubit, ComputerBooksStates>(
      buildWhen: (previous, current) =>
          previous.computerBooksState != current.computerBooksState,
      builder: (context, state) {
        switch (state.computerBooksState) {
          case RequestState.loading:
            return const VerticalCustomLoading();
          case RequestState.loaded:
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: state.computerBooks.length,
              itemBuilder: (BuildContext context, int index) => CustomBookItem(
                homeModel: state.computerBooks[index],
              ),
            );
          case RequestState.failure:
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 150.h),
              child: CustomErrorWidget(
                errorMessage: state.computerBooksErrorMessage,
              ),
            );
        }
      },
    );
  }
}
