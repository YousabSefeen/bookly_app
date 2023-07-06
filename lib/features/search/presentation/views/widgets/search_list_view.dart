import 'package:bookly/features/search/presentation/controller/search_cubit.dart';
import 'package:bookly/features/search/presentation/controller/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common presentation/widgets/custom_book_item.dart';
import '../../../../../core/common presentation/widgets/custom_error_widget.dart';
import '../../../../../core/common presentation/widgets/vertical_custom_loading.dart';
import '../../../../../core/enums/request_state.dart';

class SearchListView extends StatelessWidget {
  final String textSearch;

  const SearchListView({Key? key, required this.textSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchStates>(
      buildWhen: (previous, current) =>
          previous.searchBooksState != current.searchBooksState,
      builder: (context, state) {
        switch (state.searchBooksState) {
          case RequestState.loading:
            return const VerticalCustomLoading();
          case RequestState.loaded:
            return ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 20),
              itemCount: state.searchBooks.length,
              itemBuilder: (BuildContext context, int index) =>
                  CustomBookItem(homeModel: state.searchBooks[index]),
            );
          case RequestState.failure:
            return CustomErrorWidget(
              errorMessage: state.searchBooksErrorMessage,
            );
        }
      },
    );
  }
}
